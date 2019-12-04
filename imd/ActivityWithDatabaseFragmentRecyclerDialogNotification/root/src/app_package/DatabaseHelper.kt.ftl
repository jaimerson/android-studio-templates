package ${packageName}

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class DatabaseHelper(context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION) {
    override fun onCreate(db: SQLiteDatabase?) {
        TODO("Set proper fields for the table")
        val sql = """
            CREATE TABLE ${r"$TABLE_NAME"} (
                id INTEGER PRIMARY KEY,
            );
        """.trimIndent()
        db?.execSQL(sql)
    }

    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        db?.execSQL("DROP TABLE IF EXISTS ${r"$TABLE_NAME"}")
        onCreate(db)
    }

    companion object {
        const val DATABASE_NAME = "${databaseName}"
        const val DATABASE_VERSION = 1
        const val TABLE_NAME = "${tableName}"
    }
}