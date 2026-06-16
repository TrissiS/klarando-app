.class public Lcom/google/android/material/timepicker/RadialViewGroup;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "RadialViewGroup.java"


# instance fields
.field public A:Lc/a/a/a/l0/h;

.field public final y:Ljava/lang/Runnable;

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/timepicker/RadialViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/timepicker/RadialViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lc/a/a/a/h;->material_radial_view_group:I

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->e()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 6
    sget-object v0, Lc/a/a/a/l;->RadialViewGroup:[I

    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 8
    sget p2, Lc/a/a/a/l;->RadialViewGroup_materialCircleRadius:I

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->z:I

    .line 9
    new-instance p2, Lcom/google/android/material/timepicker/RadialViewGroup$a;

    invoke-direct {p2, p0}, Lcom/google/android/material/timepicker/RadialViewGroup$a;-><init>(Lcom/google/android/material/timepicker/RadialViewGroup;)V

    iput-object p2, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->y:Ljava/lang/Runnable;

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static b(Landroid/view/View;)Z
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    const-string v0, "skip"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_11

    .line 3
    invoke-static {}, Lb/h/m/y;->b()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setId(I)V

    .line 4
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->h()V

    return-void
.end method

.method public d(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->z:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->g()V

    return-void
.end method

.method public final e()Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 1
    new-instance v0, Lc/a/a/a/l0/h;

    invoke-direct {v0}, Lc/a/a/a/l0/h;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->A:Lc/a/a/a/l0/h;

    .line 2
    new-instance v1, Lc/a/a/a/l0/k;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-direct {v1, v2}, Lc/a/a/a/l0/k;-><init>(F)V

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Lc/a/a/a/l0/c;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->A:Lc/a/a/a/l0/h;

    const/4 v1, -0x1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->A:Lc/a/a/a/l0/h;

    return-object v0
.end method

.method public f()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->z:I

    return v0
.end method

.method public g()V
    .registers 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v0, :cond_18

    .line 2
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 3
    invoke-static {v4}, Lcom/google/android/material/timepicker/RadialViewGroup;->b(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_15

    add-int/lit8 v2, v2, 0x1

    :cond_15
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 4
    :cond_18
    new-instance v3, Lb/f/c/c;

    invoke-direct {v3}, Lb/f/c/c;-><init>()V

    .line 5
    invoke-virtual {v3, p0}, Lb/f/c/c;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    const/4 v4, 0x0

    :goto_21
    if-ge v1, v0, :cond_4b

    .line 6
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 7
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v6

    sget v7, Lc/a/a/a/f;->circle_center:I

    if-eq v6, v7, :cond_48

    invoke-static {v5}, Lcom/google/android/material/timepicker/RadialViewGroup;->b(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_36

    goto :goto_48

    .line 8
    :cond_36
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v5

    sget v6, Lc/a/a/a/f;->circle_center:I

    iget v7, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->z:I

    invoke-virtual {v3, v5, v6, v7, v4}, Lb/f/c/c;->a(IIIF)V

    const/high16 v5, 0x43b40000    # 360.0f

    sub-int v6, v0, v2

    int-to-float v6, v6

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    :cond_48
    :goto_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 9
    :cond_4b
    invoke-virtual {v3, p0}, Lb/f/c/c;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void
.end method

.method public final h()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 2
    iget-object v1, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->y:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3
    iget-object v1, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->y:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_10
    return-void
.end method

.method public onFinishInflate()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->g()V

    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewRemoved(Landroid/view/View;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/timepicker/RadialViewGroup;->h()V

    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/timepicker/RadialViewGroup;->A:Lc/a/a/a/l0/h;

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    return-void
.end method
