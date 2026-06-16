.class public Ld/a/b/g/e;
.super Ljava/lang/Object;
.source "Kits.java"


# direct methods
.method public static a(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_d

    const-string v0, ""

    .line 1
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p0, 0x1

    :goto_e
    return p0
.end method
