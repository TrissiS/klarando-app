.class public Ld/a/b/g/f;
.super Ljava/lang/Object;
.source "Kits.java"


# direct methods
.method public static a(Landroid/content/Context;)Z
    .registers 2

    if-eqz p0, :cond_16

    const-string v0, "connectivity"

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_16

    .line 3
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result p0

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method
