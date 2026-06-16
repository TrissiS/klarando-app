.class public Lc/a/a/a/d0/f;
.super Ljava/lang/Object;
.source "NavigationMenuPresenter.java"

# interfaces
.implements Lb/b/p/j/m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/d0/f$h;,
        Lc/a/a/a/d0/f$d;,
        Lc/a/a/a/d0/f$f;,
        Lc/a/a/a/d0/f$g;,
        Lc/a/a/a/d0/f$e;,
        Lc/a/a/a/d0/f$c;,
        Lc/a/a/a/d0/f$b;,
        Lc/a/a/a/d0/f$j;,
        Lc/a/a/a/d0/f$k;,
        Lc/a/a/a/d0/f$i;,
        Lc/a/a/a/d0/f$l;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public final C:Landroid/view/View$OnClickListener;

.field public h:Lcom/google/android/material/internal/NavigationMenuView;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lb/b/p/j/m$a;

.field public k:Lb/b/p/j/g;

.field public l:I

.field public m:Lc/a/a/a/d0/f$c;

.field public n:Landroid/view/LayoutInflater;

.field public o:I

.field public p:Z

.field public q:Landroid/content/res/ColorStateList;

.field public r:Landroid/content/res/ColorStateList;

.field public s:Landroid/graphics/drawable/Drawable;

.field public t:I

.field public u:I

.field public v:I

.field public w:Z

.field public x:Z

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lc/a/a/a/d0/f;->x:Z

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lc/a/a/a/d0/f;->B:I

    .line 4
    new-instance v0, Lc/a/a/a/d0/f$a;

    invoke-direct {v0, p0}, Lc/a/a/a/d0/f$a;-><init>(Lc/a/a/a/d0/f;)V

    iput-object v0, p0, Lc/a/a/a/d0/f;->C:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/d0/f;)I
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/d0/f;->y:I

    return p0
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 24
    iget v0, p0, Lc/a/a/a/d0/f;->l:I

    return v0
.end method

.method public a(I)Landroid/view/View;
    .registers 5

    .line 34
    iget-object v0, p0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    iget-object v1, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Landroid/view/View;)V

    return-object p1
.end method

.method public a(Landroid/view/ViewGroup;)Lb/b/p/j/n;
    .registers 5

    .line 7
    iget-object v0, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    if-nez v0, :cond_45

    .line 8
    iget-object v0, p0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    sget v1, Lc/a/a/a/h;->design_navigation_menu:I

    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/internal/NavigationMenuView;

    iput-object p1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    .line 10
    new-instance v0, Lc/a/a/a/d0/f$h;

    iget-object v1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-direct {v0, p0, v1}, Lc/a/a/a/d0/f$h;-><init>(Lc/a/a/a/d0/f;Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Lb/p/d/k;)V

    .line 11
    iget-object p1, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    if-nez p1, :cond_26

    .line 12
    new-instance p1, Lc/a/a/a/d0/f$c;

    invoke-direct {p1, p0}, Lc/a/a/a/d0/f$c;-><init>(Lc/a/a/a/d0/f;)V

    iput-object p1, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    .line 13
    :cond_26
    iget p1, p0, Lc/a/a/a/d0/f;->B:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_30

    .line 14
    iget-object v0, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    .line 15
    :cond_30
    iget-object p1, p0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    sget v0, Lc/a/a/a/h;->design_navigation_item_header:I

    iget-object v1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    .line 16
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    .line 17
    iget-object p1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    iget-object v0, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 18
    :cond_45
    iget-object p1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    return-object p1
.end method

.method public a(Landroid/content/Context;Lb/b/p/j/g;)V
    .registers 4

    .line 2
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/d0/f;->n:Landroid/view/LayoutInflater;

    .line 3
    iput-object p2, p0, Lc/a/a/a/d0/f;->k:Lb/b/p/j/g;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 5
    sget p2, Lc/a/a/a/d;->design_navigation_separator_vertical_padding:I

    .line 6
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lc/a/a/a/d0/f;->A:I

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 38
    iput-object p1, p0, Lc/a/a/a/d0/f;->r:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    .line 39
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 40
    iput-object p1, p0, Lc/a/a/a/d0/f;->s:Landroid/graphics/drawable/Drawable;

    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 4

    .line 25
    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_2d

    .line 26
    check-cast p1, Landroid/os/Bundle;

    const-string v0, "android:menu:list"

    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 28
    iget-object v1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_13
    const-string v0, "android:menu:adapter"

    .line 29
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 30
    iget-object v1, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v1, v0}, Lc/a/a/a/d0/f$c;->a(Landroid/os/Bundle;)V

    :cond_20
    const-string v0, "android:menu:header"

    .line 31
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object p1

    if-eqz p1, :cond_2d

    .line 32
    iget-object v0, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_2d
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 4

    .line 36
    iget-object v0, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    iget-object p1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v1, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Z)V
    .registers 4

    .line 22
    iget-object v0, p0, Lc/a/a/a/d0/f;->j:Lb/b/p/j/m$a;

    if-eqz v0, :cond_7

    .line 23
    invoke-interface {v0, p1, p2}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;Z)V

    :cond_7
    return-void
.end method

.method public a(Lb/b/p/j/i;)V
    .registers 3

    .line 33
    iget-object v0, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f$c;->a(Lb/b/p/j/i;)V

    return-void
.end method

.method public a(Lb/b/p/j/m$a;)V
    .registers 2

    .line 21
    iput-object p1, p0, Lc/a/a/a/d0/f;->j:Lb/b/p/j/m$a;

    return-void
.end method

.method public a(Lb/h/m/g0;)V
    .registers 6

    .line 42
    invoke-virtual {p1}, Lb/h/m/g0;->h()I

    move-result v0

    .line 43
    iget v1, p0, Lc/a/a/a/d0/f;->z:I

    if-eq v1, v0, :cond_d

    .line 44
    iput v0, p0, Lc/a/a/a/d0/f;->z:I

    .line 45
    invoke-virtual {p0}, Lc/a/a/a/d0/f;->l()V

    .line 46
    :cond_d
    iget-object v0, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Lb/h/m/g0;->e()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 47
    iget-object v0, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-static {v0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 19
    iget-object p1, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    if-eqz p1, :cond_7

    .line 20
    invoke-virtual {p1}, Lc/a/a/a/d0/f$c;->k()V

    :cond_7
    return-void
.end method

.method public a(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/b/p/j/r;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public b()Lb/b/p/j/i;
    .registers 2

    .line 2
    iget-object v0, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v0}, Lc/a/a/a/d0/f$c;->h()Lb/b/p/j/i;

    move-result-object v0

    return-object v0
.end method

.method public b(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/f;->l:I

    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 3
    iput-object p1, p0, Lc/a/a/a/d0/f;->q:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 5
    iget-boolean v0, p0, Lc/a/a/a/d0/f;->x:Z

    if-eq v0, p1, :cond_9

    .line 6
    iput-boolean p1, p0, Lc/a/a/a/d0/f;->x:Z

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/d0/f;->l()V

    :cond_9
    return-void
.end method

.method public b(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public c(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/f;->t:I

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public c(Z)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    if-eqz v0, :cond_7

    .line 4
    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f$c;->b(Z)V

    :cond_7
    return-void
.end method

.method public c()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public d()Landroid/os/Parcelable;
    .registers 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2
    iget-object v1, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    if-eqz v1, :cond_18

    .line 3
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 4
    iget-object v2, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->saveHierarchyState(Landroid/util/SparseArray;)V

    const-string v2, "android:menu:list"

    .line 5
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 6
    :cond_18
    iget-object v1, p0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    if-eqz v1, :cond_25

    .line 7
    invoke-virtual {v1}, Lc/a/a/a/d0/f$c;->g()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "android:menu:adapter"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 8
    :cond_25
    iget-object v1, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_38

    .line 9
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 10
    iget-object v2, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->saveHierarchyState(Landroid/util/SparseArray;)V

    const-string v2, "android:menu:header"

    .line 11
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_38
    return-object v0
.end method

.method public d(I)V
    .registers 2

    .line 12
    iput p1, p0, Lc/a/a/a/d0/f;->u:I

    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public e()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    return v0
.end method

.method public e(I)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/d0/f;->v:I

    if-eq v0, p1, :cond_d

    .line 3
    iput p1, p0, Lc/a/a/a/d0/f;->v:I

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lc/a/a/a/d0/f;->w:Z

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    :cond_d
    return-void
.end method

.method public f()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f;->s:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public f(I)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/d0/f;->y:I

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public g()I
    .registers 2

    .line 4
    iget v0, p0, Lc/a/a/a/d0/f;->t:I

    return v0
.end method

.method public g(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/f;->o:I

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/d0/f;->p:Z

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/f;->a(Z)V

    return-void
.end method

.method public h()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/f;->u:I

    return v0
.end method

.method public h(I)V
    .registers 3

    .line 2
    iput p1, p0, Lc/a/a/a/d0/f;->B:I

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    if-eqz v0, :cond_9

    .line 4
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    :cond_9
    return-void
.end method

.method public i()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/f;->y:I

    return v0
.end method

.method public j()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f;->q:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public k()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f;->r:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public final l()V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lc/a/a/a/d0/f;->x:Z

    if-eqz v0, :cond_10

    .line 2
    iget v0, p0, Lc/a/a/a/d0/f;->z:I

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    .line 3
    :goto_11
    iget-object v2, p0, Lc/a/a/a/d0/f;->h:Lcom/google/android/material/internal/NavigationMenuView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v2, v1, v0, v1, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    return-void
.end method
