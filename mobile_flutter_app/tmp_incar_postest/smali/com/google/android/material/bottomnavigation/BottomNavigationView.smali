.class public Lcom/google/android/material/bottomnavigation/BottomNavigationView;
.super Lcom/google/android/material/navigation/NavigationBarView;
.source "BottomNavigationView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/bottomnavigation/BottomNavigationView$a;,
        Lcom/google/android/material/bottomnavigation/BottomNavigationView$b;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->bottomNavigationStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    .line 3
    sget v0, Lc/a/a/a/k;->Widget_Design_BottomNavigationView:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/material/navigation/NavigationBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 6
    sget-object v2, Lc/a/a/a/l;->BottomNavigationView:[I

    const/4 v0, 0x0

    new-array v5, v0, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    move v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->d(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Lb/b/q/g0;

    move-result-object p2

    .line 8
    sget p3, Lc/a/a/a/l;->BottomNavigationView_itemHorizontalTranslationEnabled:I

    const/4 p4, 0x1

    .line 9
    invoke-virtual {p2, p3, p4}, Lb/b/q/g0;->a(IZ)Z

    move-result p3

    .line 10
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;->setItemHorizontalTranslationEnabled(Z)V

    .line 11
    invoke-virtual {p2}, Lb/b/q/g0;->b()V

    .line 12
    invoke-virtual {p0}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;->b()Z

    move-result p2

    if-eqz p2, :cond_2a

    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;->c(Landroid/content/Context;)V

    :cond_2a
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Lc/a/a/a/f0/c;
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/q/b;

    invoke-direct {v0, p1}, Lc/a/a/a/q/b;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public final b()Z
    .registers 3

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_10

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lc/a/a/a/l0/h;

    if-nez v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public final c(Landroid/content/Context;)V
    .registers 5

    .line 1
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    sget v1, Lc/a/a/a/c;->design_bottom_navigation_shadow_color:I

    .line 3
    invoke-static {p1, v1}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result p1

    .line 4
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 5
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->design_bottom_navigation_shadow_height:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {p1, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 7
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public getMaxItemCount()I
    .registers 2

    const/4 v0, 0x5

    return v0
.end method

.method public setItemHorizontalTranslationEnabled(Z)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationBarView;->getMenuView()Lb/b/p/j/n;

    move-result-object v0

    check-cast v0, Lc/a/a/a/q/b;

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/q/b;->d()Z

    move-result v1

    if-eq v1, p1, :cond_17

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/q/b;->setItemHorizontalTranslationEnabled(Z)V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/navigation/NavigationBarView;->getPresenter()Lcom/google/android/material/navigation/NavigationBarPresenter;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/material/navigation/NavigationBarPresenter;->a(Z)V

    :cond_17
    return-void
.end method

.method public setOnNavigationItemReselectedListener(Lcom/google/android/material/bottomnavigation/BottomNavigationView$a;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->setOnItemReselectedListener(Lcom/google/android/material/navigation/NavigationBarView$c;)V

    return-void
.end method

.method public setOnNavigationItemSelectedListener(Lcom/google/android/material/bottomnavigation/BottomNavigationView$b;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/navigation/NavigationBarView;->setOnItemSelectedListener(Lcom/google/android/material/navigation/NavigationBarView$d;)V

    return-void
.end method
