.class public final synthetic Ld/a/b/b/b;
.super Ljava/lang/Object;
.source "TitleBarAction.java"


# direct methods
.method public static a(Ld/a/b/b/c;Landroid/view/ViewGroup;)Lcom/hjq/bar/TitleBar;
    .registers 6
    .param p0, "_this"    # Ld/a/b/b/c;

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    .line 1
    :goto_5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_26

    .line 2
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 3
    instance-of v3, v2, Lcom/hjq/bar/TitleBar;

    if-eqz v3, :cond_16

    .line 4
    check-cast v2, Lcom/hjq/bar/TitleBar;

    return-object v2

    .line 5
    :cond_16
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_23

    .line 6
    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {p0, v2}, Ld/a/b/b/c;->a(Landroid/view/ViewGroup;)Lcom/hjq/bar/TitleBar;

    move-result-object v2

    if-eqz v2, :cond_23

    return-object v2

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_26
    return-object v0
.end method

.method public static a(Ld/a/b/b/c;Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public static b(Ld/a/b/b/c;Landroid/view/View;)V
    .registers 2

    return-void
.end method
