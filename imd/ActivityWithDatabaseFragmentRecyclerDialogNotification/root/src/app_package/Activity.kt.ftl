package ${packageName}

import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import ${packageName}.${itemAdapterClass}

class ${mainActivityClass} : AppCompatActivity() {
    val broadcastReceiver = ${broadcastReceiverClass}()
    val filter = IntentFilter(${broadcastReceiverClass}.FILTER_NAME).apply{
        addAction(${broadcastReceiverClass}.ACTION_NAME)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        applicationContext.registerReceiver(broadcastReceiver, filter)

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val itemListView = findViewById<RecyclerView>(R.id.recycler_view)
        itemListView.layoutManager = LinearLayoutManager(this, RecyclerView.VERTICAL, false)

        ${modelName}Repository.initialize(applicationContext)
        val adapter = ${itemAdapterClass}(${modelName}Repository.${tableName}List) { position ->
            val dialog = ${dialogFragmentClass} {
                val item = ${modelName}Repository.${tableName}List[position]
                ${modelName}Repository.remove${modelName}(item)
                notify${modelName}Removed(item)
            }
            dialog.show(supportFragmentManager, "${dialogFragmentClass}")
        }

        itemListView.adapter = adapter
    }

    private fun notify${modelName}Removed(item: ${modelName}) {
        Intent().also {intent ->
            intent.setAction(${broadcastReceiverClass}.ACTION_NAME)
            intent.putExtra("id", item.id)
            sendBroadcast(intent)
        }
    }
}