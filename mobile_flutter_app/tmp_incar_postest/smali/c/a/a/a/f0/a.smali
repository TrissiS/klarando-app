.class public abstract Lc/a/a/a/f0/a;
.super Landroid/widget/FrameLayout;
.source "NavigationBarItemView.java"

# interfaces
.implements Lb/b/p/j/n$a;


# static fields
.field public static final x:[I


# instance fields
.field public final h:I

.field public i:F

.field public j:F

.field public k:F

.field public l:I

.field public m:Z

.field public n:Landroid/widget/ImageView;

.field public final o:Landroid/view/ViewGroup;

.field public final p:Landroid/widget/TextView;

.field public final q:Landroid/widget/TextView;

.field public r:I

.field public s:Lb/b/p/j/i;

.field public t:Landroid/content/res/ColorStateList;

.field public u:Landroid/graphics/drawable/Drawable;

.field public v:Landroid/graphics/drawable/Drawable;

.field public w:Lcom/google/android/material/badge/BadgeDrawable;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    .line 1
    sput-object v0, Lc/a/a/a/f0/a;->x:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lc/a/a/a/f0/a;->r:I

    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p0}, Lc/a/a/a/f0/a;->getItemLayoutResId()I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 4
    sget p1, Lc/a/a/a/f;->navigation_bar_item_icon_view:I

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    .line 5
    sget p1, Lc/a/a/a/f;->navigation_bar_item_labels_group:I

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    .line 6
    sget p1, Lc/a/a/a/f;->navigation_bar_item_small_label_view:I

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    .line 7
    sget p1, Lc/a/a/a/f;->navigation_bar_item_large_label_view:I

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/f0/a;->getItemBackgroundResId()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Lc/a/a/a/f0/a;->getItemDefaultMarginResId()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lc/a/a/a/f0/a;->h:I

    .line 10
    iget-object p1, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    sget v0, Lc/a/a/a/f;->mtrl_view_tag_bottom_padding:I

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 11
    iget-object p1, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 12
    iget-object p1, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-static {p1, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 13
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 14
    iget-object p1, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    move-result p1

    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/f0/a;->a(FF)V

    .line 15
    iget-object p1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    if-eqz p1, :cond_87

    .line 16
    new-instance v0, Lc/a/a/a/f0/a$a;

    invoke-direct {v0, p0}, Lc/a/a/a/f0/a$a;-><init>(Lc/a/a/a/f0/a;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_87
    return-void
.end method

.method public static synthetic a(Lc/a/a/a/f0/a;)Landroid/widget/ImageView;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    return-object p0
.end method

.method public static a(Landroid/view/View;FFI)V
    .registers 4

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 23
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 24
    invoke-virtual {p0, p3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public static a(Landroid/view/View;I)V
    .registers 5

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .line 26
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static a(Landroid/view/View;II)V
    .registers 4

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/f0/a;Landroid/view/View;)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->d(Landroid/view/View;)V

    return-void
.end method

.method private getItemVisiblePosition()I
    .registers 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 2
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_c
    if-ge v2, v1, :cond_21

    .line 3
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    instance-of v5, v4, Lc/a/a/a/f0/a;

    if-eqz v5, :cond_1e

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_1e

    add-int/lit8 v3, v3, 0x1

    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_21
    return v3
.end method

.method private getSuggestedIconHeight()I
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    .line 3
    :goto_c
    iget-object v1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 4
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v2, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v1, v2

    add-int/2addr v1, v0

    return v1
.end method

.method private getSuggestedIconWidth()I
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_11

    .line 2
    :cond_6
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    iget-object v1, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    invoke-virtual {v1}, Lcom/google/android/material/badge/BadgeDrawable;->e()I

    move-result v1

    sub-int/2addr v0, v1

    .line 3
    :goto_11
    iget-object v1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 4
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v3, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    .line 5
    invoke-virtual {v3}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v3

    add-int/2addr v2, v3

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/2addr v2, v0

    return v2
.end method


# virtual methods
.method public final a(Landroid/view/View;)Landroid/widget/FrameLayout;
    .registers 4

    .line 31
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_10

    .line 32
    sget-boolean p1, Lc/a/a/a/o/a;->a:Z

    if-eqz p1, :cond_10

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/widget/FrameLayout;

    :cond_10
    return-object v1
.end method

.method public final a(FF)V
    .registers 5

    sub-float v0, p1, p2

    .line 27
    iput v0, p0, Lc/a/a/a/f0/a;->i:F

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float v1, p2, v0

    div-float/2addr v1, p1

    .line 28
    iput v1, p0, Lc/a/a/a/f0/a;->j:F

    mul-float p1, p1, v0

    div-float/2addr p1, p2

    .line 29
    iput p1, p0, Lc/a/a/a/f0/a;->k:F

    return-void
.end method

.method public a(Lb/b/p/j/i;I)V
    .registers 5

    .line 3
    iput-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    .line 4
    invoke-virtual {p1}, Lb/b/p/j/i;->isCheckable()Z

    move-result p2

    invoke-virtual {p0, p2}, Lc/a/a/a/f0/a;->setCheckable(Z)V

    .line 5
    invoke-virtual {p1}, Lb/b/p/j/i;->isChecked()Z

    move-result p2

    invoke-virtual {p0, p2}, Lc/a/a/a/f0/a;->setChecked(Z)V

    .line 6
    invoke-virtual {p1}, Lb/b/p/j/i;->isEnabled()Z

    move-result p2

    invoke-virtual {p0, p2}, Lc/a/a/a/f0/a;->setEnabled(Z)V

    .line 7
    invoke-virtual {p1}, Lb/b/p/j/i;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Lc/a/a/a/f0/a;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 8
    invoke-virtual {p1}, Lb/b/p/j/i;->getTitle()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Lc/a/a/a/f0/a;->setTitle(Ljava/lang/CharSequence;)V

    .line 9
    invoke-virtual {p1}, Lb/b/p/j/i;->getItemId()I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setId(I)V

    .line 10
    invoke-virtual {p1}, Lb/b/p/j/i;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3d

    .line 11
    invoke-virtual {p1}, Lb/b/p/j/i;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 12
    :cond_3d
    invoke-virtual {p1}, Lb/b/p/j/i;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4c

    .line 13
    invoke-virtual {p1}, Lb/b/p/j/i;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object p2

    goto :goto_50

    .line 14
    :cond_4c
    invoke-virtual {p1}, Lb/b/p/j/i;->getTitle()Ljava/lang/CharSequence;

    move-result-object p2

    .line 15
    :goto_50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_5a

    const/16 v1, 0x17

    if-le v0, v1, :cond_5d

    .line 16
    :cond_5a
    invoke-static {p0, p2}, Lb/b/q/i0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 17
    :cond_5d
    invoke-virtual {p1}, Lb/b/p/j/i;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_65

    const/4 p1, 0x0

    goto :goto_67

    :cond_65
    const/16 p1, 0x8

    :goto_67
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method

.method public final a()Z
    .registers 2

    .line 30
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lc/a/a/a/f0/a;->c(Landroid/view/View;)V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 4

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/f0/a;->a()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    if-eqz p1, :cond_19

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    .line 6
    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;)Landroid/widget/FrameLayout;

    move-result-object v1

    .line 7
    invoke-static {v0, p1, v1}, Lc/a/a/a/o/a;->a(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;Landroid/widget/FrameLayout;)V

    :cond_19
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/f0/a;->a()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    if-eqz p1, :cond_15

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    invoke-static {v0, p1}, Lc/a/a/a/o/a;->a(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;)V

    :cond_15
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    return-void
.end method

.method public c()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final d(Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/f0/a;->a()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;)Landroid/widget/FrameLayout;

    move-result-object v1

    .line 4
    invoke-static {v0, p1, v1}, Lc/a/a/a/o/a;->b(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;Landroid/widget/FrameLayout;)V

    return-void
.end method

.method public getBadge()Lcom/google/android/material/badge/BadgeDrawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    return-object v0
.end method

.method public getItemBackgroundResId()I
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/e;->mtrl_navigation_bar_item_background:I

    return v0
.end method

.method public getItemData()Lb/b/p/j/i;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    return-object v0
.end method

.method public getItemDefaultMarginResId()I
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/d;->mtrl_navigation_bar_item_default_margin:I

    return v0
.end method

.method public abstract getItemLayoutResId()I
.end method

.method public getItemPosition()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/a;->r:I

    return v0
.end method

.method public getSuggestedMinimumHeight()I
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    invoke-direct {p0}, Lc/a/a/a/f0/a;->getSuggestedIconHeight()I

    move-result v1

    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    .line 3
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v1, v2

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v1, v0

    return v1
.end method

.method public getSuggestedMinimumWidth()I
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iget-object v2, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    .line 3
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v1, v2

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    .line 4
    invoke-direct {p0}, Lc/a/a/a/f0/a;->getSuggestedIconWidth()I

    move-result v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public onCreateDrawableState(I)[I
    .registers 3

    add-int/lit8 p1, p1, 0x1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onCreateDrawableState(I)[I

    move-result-object p1

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Lb/b/p/j/i;->isCheckable()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {v0}, Lb/b/p/j/i;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 3
    sget-object v0, Lc/a/a/a/f0/a;->x:[I

    invoke-static {p1, v0}, Landroid/widget/FrameLayout;->mergeDrawableStates([I[I)[I

    :cond_1d
    return-object p1
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 8

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    if-eqz v0, :cond_42

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {v0}, Lb/b/p/j/i;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    .line 4
    iget-object v1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {v1}, Lb/b/p/j/i;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_25

    .line 5
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {v0}, Lb/b/p/j/i;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 6
    :cond_25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/material/badge/BadgeDrawable;->c()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 9
    :cond_42
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 10
    invoke-direct {p0}, Lc/a/a/a/f0/a;->getItemVisiblePosition()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isSelected()Z

    move-result v5

    .line 12
    invoke-static/range {v0 .. v5}, Lb/h/m/h0/c$c;->a(IIIIZZ)Lb/h/m/h0/c$c;

    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->b(Ljava/lang/Object;)V

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_68

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->e(Z)V

    .line 16
    sget-object v0, Lb/h/m/h0/c$a;->g:Lb/h/m/h0/c$a;

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->b(Lb/h/m/h0/c$a;)Z

    .line 17
    :cond_68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/j;->item_view_role_description:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->g(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/a;->w:Lcom/google/android/material/badge/BadgeDrawable;

    .line 2
    iget-object p1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    if-eqz p1, :cond_9

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->b(Landroid/view/View;)V

    :cond_9
    return-void
.end method

.method public setCheckable(Z)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->refreshDrawableState()V

    return-void
.end method

.method public setChecked(Z)V
    .registers 10

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v1

    const/4 v2, 0x2

    div-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPivotX(F)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBaseline()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPivotY(F)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v1

    div-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPivotX(F)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBaseline()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setPivotY(F)V

    .line 5
    iget v0, p0, Lc/a/a/a/f0/a;->l:I

    const/4 v1, -0x1

    const/16 v3, 0x11

    const/16 v4, 0x31

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x4

    const/4 v7, 0x0

    if-eq v0, v1, :cond_d0

    if-eqz v0, :cond_98

    const/4 v1, 0x1

    if-eq v0, v1, :cond_56

    if-eq v0, v2, :cond_41

    goto/16 :goto_14a

    .line 6
    :cond_41
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v3}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 7
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_14a

    .line 9
    :cond_56
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    sget v1, Lc/a/a/a/f;->mtrl_view_tag_bottom_padding:I

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 11
    invoke-static {v0, v1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    if-eqz p1, :cond_83

    .line 12
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    int-to-float v1, v1

    iget v2, p0, Lc/a/a/a/f0/a;->i:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 13
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-static {v0, v5, v5, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    .line 14
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    iget v1, p0, Lc/a/a/a/f0/a;->j:F

    invoke-static {v0, v1, v1, v6}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    goto/16 :goto_14a

    .line 15
    :cond_83
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 16
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    iget v1, p0, Lc/a/a/a/f0/a;->k:F

    invoke-static {v0, v1, v1, v6}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    .line 17
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-static {v0, v5, v5, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    goto/16 :goto_14a

    :cond_98
    if-eqz p1, :cond_b8

    .line 18
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 19
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    sget v1, Lc/a/a/a/f;->mtrl_view_tag_bottom_padding:I

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 21
    invoke-static {v0, v1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    .line 22
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_c9

    .line 23
    :cond_b8
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v3}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 24
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    invoke-static {v0, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    .line 25
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 26
    :goto_c9
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_14a

    .line 27
    :cond_d0
    iget-boolean v0, p0, Lc/a/a/a/f0/a;->m:Z

    if-eqz v0, :cond_10b

    if-eqz p1, :cond_f4

    .line 28
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 29
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    sget v1, Lc/a/a/a/f;->mtrl_view_tag_bottom_padding:I

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 31
    invoke-static {v0, v1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    .line 32
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_105

    .line 33
    :cond_f4
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v3}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 34
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    invoke-static {v0, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    .line 35
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 36
    :goto_105
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_14a

    .line 37
    :cond_10b
    iget-object v0, p0, Lc/a/a/a/f0/a;->o:Landroid/view/ViewGroup;

    sget v1, Lc/a/a/a/f;->mtrl_view_tag_bottom_padding:I

    .line 38
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 39
    invoke-static {v0, v1}, Lc/a/a/a/f0/a;->a(Landroid/view/View;I)V

    if-eqz p1, :cond_137

    .line 40
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    int-to-float v1, v1

    iget v2, p0, Lc/a/a/a/f0/a;->i:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 41
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-static {v0, v5, v5, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    .line 42
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    iget v1, p0, Lc/a/a/a/f0/a;->j:F

    invoke-static {v0, v1, v1, v6}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    goto :goto_14a

    .line 43
    :cond_137
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    iget v1, p0, Lc/a/a/a/f0/a;->h:I

    invoke-static {v0, v1, v4}, Lc/a/a/a/f0/a;->a(Landroid/view/View;II)V

    .line 44
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    iget v1, p0, Lc/a/a/a/f0/a;->k:F

    invoke-static {v0, v1, v1, v6}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    .line 45
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-static {v0, v5, v5, v7}, Lc/a/a/a/f0/a;->a(Landroid/view/View;FFI)V

    .line 46
    :goto_14a
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->refreshDrawableState()V

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setSelected(Z)V

    return-void
.end method

.method public setEnabled(Z)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    if-eqz p1, :cond_22

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 v0, 0x3ea

    invoke-static {p1, v0}, Lb/h/m/w;->a(Landroid/content/Context;I)Lb/h/m/w;

    move-result-object p1

    .line 6
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/w;)V

    goto :goto_26

    :cond_22
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/w;)V

    :goto_26
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->u:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput-object p1, p0, Lc/a/a/a/f0/a;->u:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_25

    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    if-nez v0, :cond_10

    goto :goto_14

    .line 4
    :cond_10
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :goto_14
    invoke-static {p1}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 5
    iput-object p1, p0, Lc/a/a/a/f0/a;->v:Landroid/graphics/drawable/Drawable;

    .line 6
    iget-object v0, p0, Lc/a/a/a/f0/a;->t:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_25

    .line 7
    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 8
    :cond_25
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setIconSize(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 3
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 4
    iget-object p1, p0, Lc/a/a/a/f0/a;->n:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/a;->t:Landroid/content/res/ColorStateList;

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lc/a/a/a/f0/a;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_12

    .line 3
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/f0/a;->v:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_12
    return-void
.end method

.method public setItemBackground(I)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_c

    .line 1
    :cond_4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 2
    :goto_c
    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    if-eqz p1, :cond_14

    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 4
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 5
    :cond_14
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setItemPosition(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/f0/a;->r:I

    return-void
.end method

.method public setLabelVisibilityMode(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/f0/a;->l:I

    if-eq v0, p1, :cond_18

    .line 2
    iput p1, p0, Lc/a/a/a/f0/a;->l:I

    .line 3
    iget-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-eqz p1, :cond_18

    .line 4
    iget-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {p1}, Lb/b/p/j/i;->isChecked()Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->setChecked(Z)V

    :cond_18
    return-void
.end method

.method public setShifting(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/f0/a;->m:Z

    if-eq v0, p1, :cond_18

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/f0/a;->m:Z

    .line 3
    iget-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-eqz p1, :cond_18

    .line 4
    iget-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    invoke-virtual {p1}, Lb/b/p/j/i;->isChecked()Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/f0/a;->setChecked(Z)V

    :cond_18
    return-void
.end method

.method public setTextAppearanceActive(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    move-result p1

    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/f0/a;->a(FF)V

    return-void
.end method

.method public setTextAppearanceInactive(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lb/h/n/i;->d(Landroid/widget/TextView;I)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    move-result p1

    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/f0/a;->a(FF)V

    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    if-eqz p1, :cond_c

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_c
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/a;->p:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/a;->q:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lb/b/p/j/i;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 4
    :cond_18
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 5
    :cond_1b
    iget-object v0, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    if-eqz v0, :cond_30

    .line 6
    invoke-virtual {v0}, Lb/b/p/j/i;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2a

    goto :goto_30

    :cond_2a
    iget-object p1, p0, Lc/a/a/a/f0/a;->s:Lb/b/p/j/i;

    .line 7
    invoke-virtual {p1}, Lb/b/p/j/i;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object p1

    .line 8
    :cond_30
    :goto_30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_3a

    const/16 v1, 0x17

    if-le v0, v1, :cond_3d

    .line 9
    :cond_3a
    invoke-static {p0, p1}, Lb/b/q/i0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    :cond_3d
    return-void
.end method
