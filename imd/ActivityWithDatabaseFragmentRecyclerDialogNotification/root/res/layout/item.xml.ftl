<?xml version="1.0" encoding="utf-8"?>
<androidx.cardview.widget.CardView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:padding="20dp"
    android:id="@+id/card_view"
    app:contentPadding="20dp"
    android:layout_width="match_parent"
    android:background="@color/cardview_dark_background"
    android:layout_height="wrap_content">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="id"
            android:textSize="22dp"
            android:textColor="@color/colorPrimaryDark"
            android:textStyle="bold"
            android:id="@+id/txt_item_id"
            />
        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="Dolorem ipsum dolor sit amet"
            android:textSize="32dp"
            android:textColor="@color/colorPrimaryDark"
            android:textStyle="bold"
            android:id="@+id/txt_item_title"
            />
        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="Dolorem ipsum dolor sit amet"
            android:textSize="22dp"
            android:textColor="@color/colorPrimaryDark"
            android:id="@+id/txt_item_content"
            />
    </LinearLayout>
</androidx.cardview.widget.CardView>