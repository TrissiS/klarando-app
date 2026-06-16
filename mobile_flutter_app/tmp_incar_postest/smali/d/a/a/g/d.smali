.class public final synthetic Ld/a/a/g/d;
.super Ljava/lang/Object;
.source "ClickAction.java"


# direct methods
.method public static varargs a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[I)V
    .registers 6
    .param p0, "_this"    # Ld/a/a/g/e;

    .line 2
    array-length v0, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_10

    aget v2, p2, v1

    .line 3
    invoke-interface {p0, v2}, Ld/a/a/g/e;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_10
    return-void
.end method

.method public static varargs a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[Landroid/view/View;)V
    .registers 6
    .param p0, "_this"    # Ld/a/a/g/e;

    .line 5
    array-length v0, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_c

    aget-object v2, p2, v1

    .line 6
    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_c
    return-void
.end method

.method public static a(Ld/a/a/g/e;Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public static varargs a(Ld/a/a/g/e;[I)V
    .registers 2
    .param p0, "_this"    # Ld/a/a/g/e;

    .line 1
    invoke-interface {p0, p0, p1}, Ld/a/a/g/e;->a(Landroid/view/View$OnClickListener;[I)V

    return-void
.end method

.method public static varargs a(Ld/a/a/g/e;[Landroid/view/View;)V
    .registers 2
    .param p0, "_this"    # Ld/a/a/g/e;

    .line 4
    invoke-interface {p0, p0, p1}, Ld/a/a/g/e;->a(Landroid/view/View$OnClickListener;[Landroid/view/View;)V

    return-void
.end method
