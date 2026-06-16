.class public abstract Lcom/google/android/material/navigation/NavigationBarView;
.super Landroid/widget/FrameLayout;
.source "NavigationBarView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/navigation/NavigationBarView$SavedState;,
        Lcom/google/android/material/navigation/NavigationBarView$c;,
        Lcom/google/android/material/navigation/NavigationBarView$d;
    }
.end annotation


# instance fields
.field public final h:Lc/a/a/a/f0/b;

.field public final i:Lc/a/a/a/f0/c;

.field public final j:Lcom/google/android/material/navigation/NavigationBarPresenter;

.field public k:Landroid/content/res/ColorStateList;

.field public l:Landroid/view/MenuInflater;

.field public m:Lcom/google/android/material/navigation/NavigationBarView$d;

.field public n:Lcom/google/android/material/navigation/NavigationBarView$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 13

    .line 1
    invoke-static {p1, p2, p3, p4}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    new-instance p1, Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-direct {p1}, Lcom/google/android/material/navigation/NavigationBarPresenter;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 4
    sget-object v2, Lc/a/a/a/l;->NavigationBarView:[I

    const/4 v0, 0x2

    new-array v5, v0, [I

    sget v0, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceInactive:I

    const/4 v6, 0x0

    aput v0, v5, v6

    sget v0, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceActive:I

    const/4 v7, 0x1

    aput v0, v5, v7

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    move v4, p4

    .line 5
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->d(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Lb/b/q/g0;

    move-result-object p2

    .line 6
    new-instance p3, Lc/a/a/a/f0/b;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p4

    invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationBarView;->getMaxItemCount()I

    move-result v0

    invoke-direct {p3, p1, p4, v0}, Lc/a/a/a/f0/b;-><init>(Landroid/content/Context;Ljava/lang/Class;I)V

    iput-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->b(Landroid/content/Context;)Lc/a/a/a/f0/c;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    .line 8
    iget-object p4, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p4, p3}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(Lc/a/a/a/f0/c;)V

    .line 9
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p3, v7}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(I)V

    .line 10
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    iget-object p4, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p3, p4}, Lc/a/a/a/f0/c;->setPresenter(Lcom/google/android/material/navigation/NavigationBarPresenter;)V

    .line 11
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    iget-object p4, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p3, p4}, Lb/b/p/j/g;->a(Lb/b/p/j/m;)V

    .line 12
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p4

    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    invoke-virtual {p3, p4, v0}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(Landroid/content/Context;Lb/b/p/j/g;)V

    .line 13
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemIconTint:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_75

    .line 14
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    sget p4, Lc/a/a/a/l;->NavigationBarView_itemIconTint:I

    .line 15
    invoke-virtual {p2, p4}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 16
    invoke-virtual {p3, p4}, Lc/a/a/a/f0/c;->setIconTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_81

    .line 17
    :cond_75
    iget-object p3, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    const p4, 0x1010038

    .line 18
    invoke-virtual {p3, p4}, Lc/a/a/a/f0/c;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 19
    invoke-virtual {p3, p4}, Lc/a/a/a/f0/c;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 20
    :goto_81
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemIconSize:I

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Lc/a/a/a/d;->mtrl_navigation_bar_item_default_icon_size:I

    .line 22
    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    .line 23
    invoke-virtual {p2, p3, p4}, Lb/b/q/g0;->c(II)I

    move-result p3

    .line 24
    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setItemIconSize(I)V

    .line 25
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceInactive:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_a5

    .line 26
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceInactive:I

    .line 27
    invoke-virtual {p2, p3, v6}, Lb/b/q/g0;->g(II)I

    move-result p3

    .line 28
    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setItemTextAppearanceInactive(I)V

    .line 29
    :cond_a5
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceActive:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_b6

    .line 30
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextAppearanceActive:I

    .line 31
    invoke-virtual {p2, p3, v6}, Lb/b/q/g0;->g(II)I

    move-result p3

    .line 32
    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setItemTextAppearanceActive(I)V

    .line 33
    :cond_b6
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextColor:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_c7

    .line 34
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemTextColor:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    .line 35
    :cond_c7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-eqz p3, :cond_d5

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    instance-of p3, p3, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p3, :cond_dc

    .line 36
    :cond_d5
    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->a(Landroid/content/Context;)Lc/a/a/a/l0/h;

    move-result-object p3

    invoke-static {p0, p3}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 37
    :cond_dc
    sget p3, Lc/a/a/a/l;->NavigationBarView_elevation:I

    invoke-virtual {p2, p3}, Lb/b/q/g0;->g(I)Z

    move-result p3

    if-eqz p3, :cond_ee

    .line 38
    sget p3, Lc/a/a/a/l;->NavigationBarView_elevation:I

    invoke-virtual {p2, p3, v6}, Lb/b/q/g0;->c(II)I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setElevation(F)V

    .line 39
    :cond_ee
    sget p3, Lc/a/a/a/l;->NavigationBarView_backgroundTint:I

    .line 40
    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-static {p4, p3}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 42
    sget p3, Lc/a/a/a/l;->NavigationBarView_labelVisibilityMode:I

    const/4 p4, -0x1

    .line 43
    invoke-virtual {p2, p3, p4}, Lb/b/q/g0;->e(II)I

    move-result p3

    .line 44
    invoke-virtual {p0, p3}, Lcom/google/android/material/navigation/NavigationBarView;->setLabelVisibilityMode(I)V

    .line 45
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemBackground:I

    invoke-virtual {p2, p3, v6}, Lb/b/q/g0;->g(II)I

    move-result p3

    if-eqz p3, :cond_117

    .line 46
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1, p3}, Lc/a/a/a/f0/c;->setItemBackgroundRes(I)V

    goto :goto_120

    .line 47
    :cond_117
    sget p3, Lc/a/a/a/l;->NavigationBarView_itemRippleColor:I

    .line 48
    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Lb/b/q/g0;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->setItemRippleColor(Landroid/content/res/ColorStateList;)V

    .line 50
    :goto_120
    sget p1, Lc/a/a/a/l;->NavigationBarView_menu:I

    invoke-virtual {p2, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_131

    .line 51
    sget p1, Lc/a/a/a/l;->NavigationBarView_menu:I

    invoke-virtual {p2, p1, v6}, Lb/b/q/g0;->g(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->a(I)V

    .line 52
    :cond_131
    invoke-virtual {p2}, Lb/b/q/g0;->b()V

    .line 53
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 54
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    new-instance p2, Lcom/google/android/material/navigation/NavigationBarView$a;

    invoke-direct {p2, p0}, Lcom/google/android/material/navigation/NavigationBarView$a;-><init>(Lcom/google/android/material/navigation/NavigationBarView;)V

    invoke-virtual {p1, p2}, Lb/b/p/j/g;->a(Lb/b/p/j/g$a;)V

    .line 55
    invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationBarView;->a()V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/navigation/NavigationBarView;)Lcom/google/android/material/navigation/NavigationBarView$c;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/navigation/NavigationBarView;->n:Lcom/google/android/material/navigation/NavigationBarView$c;

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/navigation/NavigationBarView;)Lcom/google/android/material/navigation/NavigationBarView$d;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/navigation/NavigationBarView;->m:Lcom/google/android/material/navigation/NavigationBarView$d;

    return-object p0
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->l:Landroid/view/MenuInflater;

    if-nez v0, :cond_f

    .line 2
    new-instance v0, Lb/b/p/g;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/b/p/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->l:Landroid/view/MenuInflater;

    .line 3
    :cond_f
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->l:Landroid/view/MenuInflater;

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lc/a/a/a/l0/h;
    .registers 5

    .line 3
    new-instance v0, Lc/a/a/a/l0/h;

    invoke-direct {v0}, Lc/a/a/a/l0/h;-><init>()V

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 5
    instance-of v2, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_1a

    .line 6
    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    .line 7
    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 9
    :cond_1a
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    return-object v0
.end method

.method public final a()V
    .registers 2

    .line 2
    new-instance v0, Lcom/google/android/material/navigation/NavigationBarView$b;

    invoke-direct {v0, p0}, Lcom/google/android/material/navigation/NavigationBarView$b;-><init>(Lcom/google/android/material/navigation/NavigationBarView;)V

    invoke-static {p0, v0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;Lc/a/a/a/d0/t$e;)V

    return-void
.end method

.method public a(I)V
    .registers 5

    .line 10
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    .line 11
    invoke-direct {p0}, Lcom/google/android/material/navigation/NavigationBarView;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    invoke-virtual {v0, p1, v2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 12
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    .line 13
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {p1, v1}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(Z)V

    return-void
.end method

.method public abstract b(Landroid/content/Context;)Lc/a/a/a/f0/c;
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getItemBackgroundResource()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemBackgroundRes()I

    move-result v0

    return v0
.end method

.method public getItemIconSize()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemIconSize()I

    move-result v0

    return v0
.end method

.method public getItemIconTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getIconTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getItemRippleColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->k:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getItemTextAppearanceActive()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemTextAppearanceActive()I

    move-result v0

    return v0
.end method

.method public getItemTextAppearanceInactive()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemTextAppearanceInactive()I

    move-result v0

    return v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getItemTextColor()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getLabelVisibilityMode()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getLabelVisibilityMode()I

    move-result v0

    return v0
.end method

.method public abstract getMaxItemCount()I
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    return-object v0
.end method

.method public getMenuView()Lb/b/p/j/n;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    return-object v0
.end method

.method public getPresenter()Lcom/google/android/material/navigation/NavigationBarPresenter;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    return-object v0
.end method

.method public getSelectedItemId()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getSelectedItemId()I

    move-result v0

    return v0
.end method

.method public onAttachedToWindow()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    invoke-static {p0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    instance-of v0, p1, Lcom/google/android/material/navigation/NavigationBarView$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Lcom/google/android/material/navigation/NavigationBarView$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    iget-object p1, p1, Lcom/google/android/material/navigation/NavigationBarView$SavedState;->j:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->d(Landroid/os/Bundle;)V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/navigation/NavigationBarView$SavedState;

    invoke-direct {v1, v0}, Lcom/google/android/material/navigation/NavigationBarView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, v1, Lcom/google/android/material/navigation/NavigationBarView$SavedState;->j:Landroid/os/Bundle;

    .line 4
    iget-object v2, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    invoke-virtual {v2, v0}, Lb/b/p/j/g;->f(Landroid/os/Bundle;)V

    return-object v1
.end method

.method public setElevation(F)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 3
    :cond_9
    invoke-static {p0, p1}, Lc/a/a/a/l0/i;->a(Landroid/view/View;F)V

    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->k:Landroid/content/res/ColorStateList;

    return-void
.end method

.method public setItemBackgroundResource(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemBackgroundRes(I)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->k:Landroid/content/res/ColorStateList;

    return-void
.end method

.method public setItemIconSize(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemIconSize(I)V

    return-void
.end method

.method public setItemIconSizeRes(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->setItemIconSize(I)V

    return-void
.end method

.method public setItemIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setIconTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setItemRippleColor(Landroid/content/res/ColorStateList;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->k:Landroid/content/res/ColorStateList;

    const/4 v1, 0x0

    if-ne v0, p1, :cond_15

    if-nez p1, :cond_14

    .line 2
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1}, Lc/a/a/a/f0/c;->getItemBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 3
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1, v1}, Lc/a/a/a/f0/c;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_14
    return-void

    .line 4
    :cond_15
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->k:Landroid/content/res/ColorStateList;

    if-nez p1, :cond_1f

    .line 5
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1, v1}, Lc/a/a/a/f0/c;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4b

    .line 6
    :cond_1f
    invoke-static {p1}, Lc/a/a/a/j0/b;->a(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_34

    .line 8
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v2, p1, v1, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Lc/a/a/a/f0/c;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4b

    .line 9
    :cond_34
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, 0x3727c5ac    # 1.0E-5f

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 11
    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 12
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 13
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1, v0}, Lc/a/a/a/f0/c;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_4b
    return-void
.end method

.method public setItemTextAppearanceActive(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemTextAppearanceActive(I)V

    return-void
.end method

.method public setItemTextAppearanceInactive(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemTextAppearanceInactive(I)V

    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setLabelVisibilityMode(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0}, Lc/a/a/a/f0/c;->getLabelVisibilityMode()I

    move-result v0

    if-eq v0, p1, :cond_13

    .line 2
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setLabelVisibilityMode(I)V

    .line 3
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(Z)V

    :cond_13
    return-void
.end method

.method public setOnItemReselectedListener(Lcom/google/android/material/navigation/NavigationBarView$c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->n:Lcom/google/android/material/navigation/NavigationBarView$c;

    return-void
.end method

.method public setOnItemSelectedListener(Lcom/google/android/material/navigation/NavigationBarView$d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarView;->m:Lcom/google/android/material/navigation/NavigationBarView$d;

    return-void
.end method

.method public setSelectedItemId(I)V
    .registers 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_17

    .line 2
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarView;->h:Lc/a/a/a/f0/b;

    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationBarView;->j:Lcom/google/android/material/navigation/NavigationBarPresenter;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z

    move-result v0

    if-nez v0, :cond_17

    const/4 v0, 0x1

    .line 3
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    :cond_17
    return-void
.end method
