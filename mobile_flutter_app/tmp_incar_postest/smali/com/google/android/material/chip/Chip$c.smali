.class public Lcom/google/android/material/chip/Chip$c;
.super Lb/j/a/a;
.source "Chip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/chip/Chip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic q:Lcom/google/android/material/chip/Chip;


# direct methods
.method public constructor <init>(Lcom/google/android/material/chip/Chip;Lcom/google/android/material/chip/Chip;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    .line 2
    invoke-direct {p0, p2}, Lb/j/a/a;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(FF)I
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {v0}, Lcom/google/android/material/chip/Chip;->b(Lcom/google/android/material/chip/Chip;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {v0}, Lcom/google/android/material/chip/Chip;->c(Lcom/google/android/material/chip/Chip;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_16

    const/4 p1, 0x1

    goto :goto_17

    :cond_16
    const/4 p1, 0x0

    :goto_17
    return p1
.end method

.method public a(ILb/h/m/h0/c;)V
    .registers 9

    const-string v0, ""

    const/4 v1, 0x1

    if-ne p1, v1, :cond_4e

    .line 7
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Lcom/google/android/material/chip/Chip;->getCloseIconContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 8
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->b(Ljava/lang/CharSequence;)V

    goto :goto_36

    .line 9
    :cond_11
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    .line 10
    iget-object v2, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    .line 11
    invoke-virtual {v2}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lc/a/a/a/j;->mtrl_chip_close_icon_content_description:I

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_29

    move-object v0, p1

    :cond_29
    aput-object v0, v1, v4

    .line 13
    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 15
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->b(Ljava/lang/CharSequence;)V

    .line 16
    :goto_36
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {p1}, Lcom/google/android/material/chip/Chip;->e(Lcom/google/android/material/chip/Chip;)Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->c(Landroid/graphics/Rect;)V

    .line 17
    sget-object p1, Lb/h/m/h0/c$a;->g:Lb/h/m/h0/c$a;

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(Lb/h/m/h0/c$a;)V

    .line 18
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isEnabled()Z

    move-result p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->f(Z)V

    goto :goto_58

    .line 19
    :cond_4e
    invoke-virtual {p2, v0}, Lb/h/m/h0/c;->b(Ljava/lang/CharSequence;)V

    .line 20
    invoke-static {}, Lcom/google/android/material/chip/Chip;->p()Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->c(Landroid/graphics/Rect;)V

    :goto_58
    return-void
.end method

.method public a(IZ)V
    .registers 4

    const/4 v0, 0x1

    if-ne p1, v0, :cond_d

    .line 5
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {p1, p2}, Lcom/google/android/material/chip/Chip;->a(Lcom/google/android/material/chip/Chip;Z)Z

    .line 6
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->refreshDrawableState()V

    :cond_d
    return-void
.end method

.method public a(Lb/h/m/h0/c;)V
    .registers 5

    .line 21
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->c(Z)V

    .line 22
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isClickable()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->e(Z)V

    .line 23
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_23

    goto :goto_29

    :cond_23
    const-string v0, "android.view.View"

    .line 24
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    goto :goto_39

    .line 25
    :cond_29
    :goto_29
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    .line 26
    invoke-virtual {v0}, Lcom/google/android/material/chip/Chip;->f()Z

    move-result v0

    if-eqz v0, :cond_34

    const-string v0, "android.widget.CompoundButton"

    goto :goto_36

    :cond_34
    const-string v0, "android.widget.Button"

    .line 27
    :goto_36
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    .line 28
    :goto_39
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 29
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_49

    .line 30
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->i(Ljava/lang/CharSequence;)V

    goto :goto_4c

    .line 31
    :cond_49
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->b(Ljava/lang/CharSequence;)V

    :goto_4c
    return-void
.end method

.method public a(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3
    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {v0}, Lcom/google/android/material/chip/Chip;->b(Lcom/google/android/material/chip/Chip;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {v0}, Lcom/google/android/material/chip/Chip;->g()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-static {v0}, Lcom/google/android/material/chip/Chip;->d(Lcom/google/android/material/chip/Chip;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_28
    return-void
.end method

.method public a(IILandroid/os/Bundle;)Z
    .registers 4

    const/16 p3, 0x10

    if-ne p2, p3, :cond_17

    if-nez p1, :cond_d

    .line 32
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->performClick()Z

    move-result p1

    return p1

    :cond_d
    const/4 p2, 0x1

    if-ne p1, p2, :cond_17

    .line 33
    iget-object p1, p0, Lcom/google/android/material/chip/Chip$c;->q:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p1}, Lcom/google/android/material/chip/Chip;->h()Z

    move-result p1

    return p1

    :cond_17
    const/4 p1, 0x0

    return p1
.end method
