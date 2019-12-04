<?xml version="1.0"?>
<recipe>
    <instantiate from="src/app_package/Model.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${modelName}.kt" />

    <instantiate from="src/app_package/Repository.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${modelName}Repository.kt" />

    <instantiate from="src/app_package/DatabaseHelper.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/DatabaseHelper.kt" />

    <instantiate from="src/app_package/NotificationUtils.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/NotificationUtils.kt" />

    <instantiate from="src/app_package/Activity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${mainActivityClass}.kt" />

    <instantiate from="src/app_package/DialogFragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${dialogFragmentClass}.kt" />

    <instantiate from="src/app_package/BroadcastReceiver.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${broadcastReceiverClass}.kt" />

    <instantiate from="src/app_package/Adapter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${itemAdapterClass}.kt" />

    <instantiate from="res/layout/activity.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${mainActivityLayout}.xml" />

    <instantiate from="res/layout/item.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${itemLayout}.xml" />
    
    <open file="${escapeXmlAttribute(resOut)}/layout/${mainActivityLayout}.xml" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${itemLayout}.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/${modelName}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/DatabaseHelper.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/NotificationUtils.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${modelName}Repository.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${mainActivityClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${dialogFragmentClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${broadcastReceiverClass}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/${itemAdapterClass}.kt" />
</recipe>