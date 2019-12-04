package ${packageName}

import android.content.Context
import android.database.Cursor

class ${modelName}Repository {
    companion object {
        private var databaseHelper: DatabaseHelper? = null
        var ${tableName}List: ArrayList<${modelName}> = ArrayList()

        fun initialize(context: Context){
            this.databaseHelper = DatabaseHelper(context)
            refresh()
        }

        fun refresh(){
            this.${tableName}List = retrieveAll()
        }

        fun retrieveAll(): ArrayList<${modelName}> {
            val list = ArrayList<${modelName}>()
            val connection = databaseHelper!!.readableDatabase
            val cursor: Cursor = connection.rawQuery("SELECT * FROM ${r"${DatabaseHelper.TABLE_NAME}"} ORDER BY id ASC", null)

            while(cursor.moveToNext()){
                val id = cursor.getInt(cursor.getColumnIndex("id"))
                val title = cursor.getString(cursor.getColumnIndex(("title")))
                val content = cursor.getString(cursor.getColumnIndex(("content")))
                list.add(${modelName}(id, title, content))
            }
            cursor.close()
            connection.close()

            return list
        }

        fun add${modelName}(item: ${modelName}) {
            val connection = databaseHelper!!.writableDatabase
            connection.execSQL("""
                INSERT INTO ${r"${DatabaseHelper.TABLE_NAME}"} (title, content)
                VALUES ("${r"${item.title}"}", "${r"${item.content}"}");
            """.trimIndent())

            connection.close()
            refresh()
        }

        fun remove${modelName}(item: ${modelName}) {
            this.${tableName}List.remove(item)
            val connection = databaseHelper!!.writableDatabase
            connection.execSQL("""
                DELETE FROM "${r"${DatabaseHelper.TABLE_NAME}"}"
                WHERE id = ${r"${item.id}"};
            """.trimIndent())

            connection.close()
        }

        fun update${modelName}(item: ${modelName}) {
            val connection = databaseHelper!!.writableDatabase
            connection.execSQL("""
                UPDATE ${r"${DatabaseHelper.TABLE_NAME}"}
                SET title = "${r"${item.title}"}", content = "${r"${item.content}"}
                WHERE id = ${r"${item.id}"};
            """.trimIndent())

            connection.close()
            refresh()
        }
    }
}