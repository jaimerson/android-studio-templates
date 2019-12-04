package ${packageName}

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView

class ${itemAdapterClass}(val itemList: ArrayList<${modelName}>, val longClickListener: (Int) -> Unit) : RecyclerView.Adapter<${itemAdapterClass}.ViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.${itemLayout}, parent, false)
        return ViewHolder(view)
    }

    override fun getItemCount(): Int {
        return itemList.size
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val item = itemList[position]

        holder.bind(position, longClickListener)
        holder.idTextView.text = item.id.toString()
        holder.titleTextView.text = item.title
        holder.contentTextView.text = item.content
    }

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val idTextView: TextView = itemView.findViewById<TextView>(R.id.txt_item_id)
        val titleTextView: TextView = itemView.findViewById<TextView>(R.id.txt_item_title)
        val contentTextView: TextView = itemView.findViewById<TextView>(R.id.txt_item_content)

        fun bind(position: Int, longClickListener: (Int) -> Unit) = with(itemView){
            val itemView = itemView.findViewById<CardView>(R.id.card_view)
            itemView.setOnLongClickListener {
                longClickListener(position)

                true
            }
        }
    }
}