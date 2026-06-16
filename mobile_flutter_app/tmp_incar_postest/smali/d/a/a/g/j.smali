.class public final synthetic Ld/a/a/g/j;
.super Ljava/lang/Object;
.source "ResourcesAction.java"


# direct methods
.method public static a(Ld/a/a/g/k;)Landroid/content/res/Resources;
    .registers 2
    .param p0, "_this"    # Ld/a/a/g/k;

    .line 1
    invoke-interface {p0}, Ld/a/a/g/k;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ld/a/a/g/k;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "_this"    # Ld/a/a/g/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TS;>;)TS;"
        }
    .end annotation

    .line 3
    invoke-interface {p0}, Ld/a/a/g/k;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public static a(Ld/a/a/g/k;I)Ljava/lang/String;
    .registers 3
    .param p0, "_this"    # Ld/a/a/g/k;

    .line 2
    invoke-interface {p0}, Ld/a/a/g/k;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
