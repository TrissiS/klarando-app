.class public final synthetic Lc/c/d/k/a;
.super Ljava/lang/Object;
.source "IToast.java"


# direct methods
.method public static a(Lc/c/d/k/b;Landroid/view/View;)Landroid/widget/TextView;
    .registers 5
    .param p0, "_this"    # Lc/c/d/k/b;

    .line 1
    instance-of v0, p1, Landroid/widget/TextView;

    const v1, 0x102000b

    if-eqz v0, :cond_23

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_12

    .line 3
    invoke-virtual {p1, v1}, Landroid/view/View;->setId(I)V

    goto :goto_18

    .line 4
    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    if-ne v0, v1, :cond_1b

    .line 5
    :goto_18
    check-cast p1, Landroid/widget/TextView;

    return-object p1

    .line 6
    :cond_1b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You must set the ID value of TextView to android.R.id.message"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 7
    :cond_23
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_32

    .line 8
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    return-object p1

    .line 9
    :cond_32
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "You must include a TextView with an ID value of android.R.id.message"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
