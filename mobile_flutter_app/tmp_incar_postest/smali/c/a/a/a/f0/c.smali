.class public abstract Lc/a/a/a/f0/c;
.super Landroid/view/ViewGroup;
.source "NavigationBarMenuView.java"

# interfaces
.implements Lb/b/p/j/n;


# static fields
.field public static final A:[I

.field public static final B:[I


# instance fields
.field public final h:Landroidx/transition/TransitionSet;

.field public final i:Landroid/view/View$OnClickListener;

.field public final j:Lb/h/l/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/h/l/e<",
            "Lc/a/a/a/f0/a;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View$OnTouchListener;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:[Lc/a/a/a/f0/a;

.field public n:I

.field public o:I

.field public p:Landroid/content/res/ColorStateList;

.field public q:I

.field public r:Landroid/content/res/ColorStateList;

.field public final s:Landroid/content/res/ColorStateList;

.field public t:I

.field public u:I

.field public v:Landroid/graphics/drawable/Drawable;

.field public w:I

.field public x:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;"
        }
    .end annotation
.end field

.field public y:Lcom/google/android/material/navigation/NavigationBarPresenter;

.field public z:Lb/b/p/j/g;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, 0x10100a0

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 1
    sput-object v1, Lc/a/a/a/f0/c;->A:[I

    new-array v0, v0, [I

    const v1, -0x101009e

    aput v1, v0, v3

    .line 2
    sput-object v0, Lc/a/a/a/f0/c;->B:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Lb/h/l/g;

    const/4 v0, 0x5

    invoke-direct {p1, v0}, Lb/h/l/g;-><init>(I)V

    iput-object p1, p0, Lc/a/a/a/f0/c;->j:Lb/h/l/e;

    .line 3
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1, v0}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Lc/a/a/a/f0/c;->k:Landroid/util/SparseArray;

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lc/a/a/a/f0/c;->n:I

    .line 5
    iput p1, p0, Lc/a/a/a/f0/c;->o:I

    .line 6
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1, v0}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v1, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    const v0, 0x1010038

    .line 7
    invoke-virtual {p0, v0}, Lc/a/a/a/f0/c;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/f0/c;->s:Landroid/content/res/ColorStateList;

    .line 8
    new-instance v0, Landroidx/transition/AutoTransition;

    invoke-direct {v0}, Landroidx/transition/AutoTransition;-><init>()V

    iput-object v0, p0, Lc/a/a/a/f0/c;->h:Landroidx/transition/TransitionSet;

    .line 9
    invoke-virtual {v0, p1}, Landroidx/transition/TransitionSet;->c(I)Landroidx/transition/TransitionSet;

    .line 10
    iget-object p1, p0, Lc/a/a/a/f0/c;->h:Landroidx/transition/TransitionSet;

    const-wide/16 v0, 0x73

    invoke-virtual {p1, v0, v1}, Landroidx/transition/TransitionSet;->a(J)Landroidx/transition/TransitionSet;

    .line 11
    iget-object p1, p0, Lc/a/a/a/f0/c;->h:Landroidx/transition/TransitionSet;

    new-instance v0, Lb/m/a/a/b;

    invoke-direct {v0}, Lb/m/a/a/b;-><init>()V

    invoke-virtual {p1, v0}, Landroidx/transition/TransitionSet;->a(Landroid/animation/TimeInterpolator;)Landroidx/transition/TransitionSet;

    .line 12
    iget-object p1, p0, Lc/a/a/a/f0/c;->h:Landroidx/transition/TransitionSet;

    new-instance v0, Lc/a/a/a/d0/k;

    invoke-direct {v0}, Lc/a/a/a/d0/k;-><init>()V

    invoke-virtual {p1, v0}, Landroidx/transition/TransitionSet;->a(Landroidx/transition/Transition;)Landroidx/transition/TransitionSet;

    .line 13
    new-instance p1, Lc/a/a/a/f0/c$a;

    invoke-direct {p1, p0}, Lc/a/a/a/f0/c$a;-><init>(Lc/a/a/a/f0/c;)V

    iput-object p1, p0, Lc/a/a/a/f0/c;->i:Landroid/view/View$OnClickListener;

    const/4 p1, 0x1

    .line 14
    invoke-static {p0, p1}, Lb/h/m/y;->h(Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/f0/c;)Lcom/google/android/material/navigation/NavigationBarPresenter;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    return-object p0
.end method

.method public static synthetic b(Lc/a/a/a/f0/c;)Lb/b/p/j/g;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    return-object p0
.end method

.method private getNewItem()Lc/a/a/a/f0/a;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->j:Lb/h/l/e;

    invoke-interface {v0}, Lb/h/l/e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/f0/a;

    if-nez v0, :cond_12

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/f0/c;->a(Landroid/content/Context;)Lc/a/a/a/f0/a;

    move-result-object v0

    :cond_12
    return-object v0
.end method

.method private setBadgeIfNeeded(Lc/a/a/a/f0/a;)V
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getId()I

    move-result v0

    .line 2
    invoke-virtual {p0, v0}, Lc/a/a/a/f0/c;->b(I)Z

    move-result v1

    if-nez v1, :cond_b

    return-void

    .line 3
    :cond_b
    iget-object v1, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/badge/BadgeDrawable;

    if-eqz v0, :cond_18

    .line 4
    invoke-virtual {p1, v0}, Lc/a/a/a/f0/a;->setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V

    :cond_18
    return-void
.end method


# virtual methods
.method public a(I)Landroid/content/res/ColorStateList;
    .registers 11

    .line 3
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    const/4 v1, 0x0

    if-nez p1, :cond_16

    return-object v1

    .line 5
    :cond_16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-static {p1, v3}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 7
    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    sget v4, Lb/b/a;->colorPrimary:I

    .line 8
    invoke-virtual {v3, v4, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-nez v3, :cond_31

    return-object v1

    .line 9
    :cond_31
    iget v0, v0, Landroid/util/TypedValue;->data:I

    .line 10
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    .line 11
    new-instance v3, Landroid/content/res/ColorStateList;

    const/4 v4, 0x3

    new-array v5, v4, [[I

    sget-object v6, Lc/a/a/a/f0/c;->B:[I

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Lc/a/a/a/f0/c;->A:[I

    aput-object v6, v5, v2

    sget-object v6, Landroid/view/ViewGroup;->EMPTY_STATE_SET:[I

    const/4 v8, 0x2

    aput-object v6, v5, v8

    new-array v4, v4, [I

    sget-object v6, Lc/a/a/a/f0/c;->B:[I

    .line 12
    invoke-virtual {p1, v6, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    aput p1, v4, v7

    aput v0, v4, v2

    aput v1, v4, v8

    invoke-direct {v3, v5, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method public abstract a(Landroid/content/Context;)Lc/a/a/a/f0/a;
.end method

.method public a()V
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 14
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    .line 15
    array-length v2, v0

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v2, :cond_1b

    aget-object v4, v0, v3

    if-eqz v4, :cond_18

    .line 16
    iget-object v5, p0, Lc/a/a/a/f0/c;->j:Lb/h/l/e;

    invoke-interface {v5, v4}, Lb/h/l/e;->a(Ljava/lang/Object;)Z

    .line 17
    invoke-virtual {v4}, Lc/a/a/a/f0/a;->b()V

    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 18
    :cond_1b
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->size()I

    move-result v0

    if-nez v0, :cond_2b

    .line 19
    iput v1, p0, Lc/a/a/a/f0/c;->n:I

    .line 20
    iput v1, p0, Lc/a/a/a/f0/c;->o:I

    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    return-void

    .line 22
    :cond_2b
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->b()V

    .line 23
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->size()I

    move-result v0

    new-array v0, v0, [Lc/a/a/a/f0/a;

    iput-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    .line 24
    iget v0, p0, Lc/a/a/a/f0/c;->l:I

    iget-object v2, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v2}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lc/a/a/a/f0/c;->a(II)Z

    move-result v0

    const/4 v2, 0x0

    .line 25
    :goto_49
    iget-object v3, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v3}, Lb/b/p/j/g;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_d4

    .line 26
    iget-object v3, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {v3, v4}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    .line 27
    iget-object v3, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v3, v2}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 28
    iget-object v3, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {v3, v1}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    .line 29
    invoke-direct {p0}, Lc/a/a/a/f0/c;->getNewItem()Lc/a/a/a/f0/a;

    move-result-object v3

    .line 30
    iget-object v4, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    aput-object v3, v4, v2

    .line 31
    iget-object v4, p0, Lc/a/a/a/f0/c;->p:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 32
    iget v4, p0, Lc/a/a/a/f0/c;->q:I

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setIconSize(I)V

    .line 33
    iget-object v4, p0, Lc/a/a/a/f0/c;->s:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 34
    iget v4, p0, Lc/a/a/a/f0/c;->t:I

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextAppearanceInactive(I)V

    .line 35
    iget v4, p0, Lc/a/a/a/f0/c;->u:I

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextAppearanceActive(I)V

    .line 36
    iget-object v4, p0, Lc/a/a/a/f0/c;->r:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 37
    iget-object v4, p0, Lc/a/a/a/f0/c;->v:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_93

    .line 38
    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_98

    .line 39
    :cond_93
    iget v4, p0, Lc/a/a/a/f0/c;->w:I

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setItemBackground(I)V

    .line 40
    :goto_98
    invoke-virtual {v3, v0}, Lc/a/a/a/f0/a;->setShifting(Z)V

    .line 41
    iget v4, p0, Lc/a/a/a/f0/c;->l:I

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setLabelVisibilityMode(I)V

    .line 42
    iget-object v4, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v4, v2}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    .line 43
    invoke-virtual {v3, v4, v1}, Lc/a/a/a/f0/a;->a(Lb/b/p/j/i;I)V

    .line 44
    invoke-virtual {v3, v2}, Lc/a/a/a/f0/a;->setItemPosition(I)V

    .line 45
    invoke-virtual {v4}, Lb/b/p/j/i;->getItemId()I

    move-result v4

    .line 46
    iget-object v5, p0, Lc/a/a/a/f0/c;->k:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View$OnTouchListener;

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 47
    iget-object v5, p0, Lc/a/a/a/f0/c;->i:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget v5, p0, Lc/a/a/a/f0/c;->n:I

    if-eqz v5, :cond_ca

    if-ne v4, v5, :cond_ca

    .line 49
    iput v2, p0, Lc/a/a/a/f0/c;->o:I

    .line 50
    :cond_ca
    invoke-direct {p0, v3}, Lc/a/a/a/f0/c;->setBadgeIfNeeded(Lc/a/a/a/f0/a;)V

    .line 51
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_49

    .line 52
    :cond_d4
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->size()I

    move-result v0

    sub-int/2addr v0, v4

    iget v1, p0, Lc/a/a/a/f0/c;->o:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lc/a/a/a/f0/c;->o:I

    .line 53
    iget-object v1, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v1, v0}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public a(Lb/b/p/j/g;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    return-void
.end method

.method public a(II)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p1, v2, :cond_9

    const/4 p1, 0x3

    if-le p2, p1, :cond_c

    goto :goto_d

    :cond_9
    if-nez p1, :cond_c

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public final b()V
    .registers 5

    .line 2
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 3
    :goto_7
    iget-object v3, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v3}, Lb/b/p/j/g;->size()I

    move-result v3

    if-ge v2, v3, :cond_23

    .line 4
    iget-object v3, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v3, v2}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 5
    :cond_23
    :goto_23
    iget-object v2, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_43

    .line 6
    iget-object v2, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    .line 8
    iget-object v3, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->delete(I)V

    :cond_40
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    :cond_43
    return-void
.end method

.method public final b(I)Z
    .registers 3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_5

    const/4 p1, 0x1

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    :goto_6
    return p1
.end method

.method public c()V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    if-eqz v0, :cond_7c

    iget-object v1, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-nez v1, :cond_9

    goto :goto_7c

    .line 2
    :cond_9
    invoke-virtual {v0}, Lb/b/p/j/g;->size()I

    move-result v0

    .line 3
    iget-object v1, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    array-length v1, v1

    if-eq v0, v1, :cond_16

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->a()V

    return-void

    .line 5
    :cond_16
    iget v1, p0, Lc/a/a/a/f0/c;->n:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1a
    if-ge v3, v0, :cond_33

    .line 6
    iget-object v4, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v4, v3}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 7
    invoke-interface {v4}, Landroid/view/MenuItem;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_30

    .line 8
    invoke-interface {v4}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    iput v4, p0, Lc/a/a/a/f0/c;->n:I

    .line 9
    iput v3, p0, Lc/a/a/a/f0/c;->o:I

    :cond_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 10
    :cond_33
    iget v3, p0, Lc/a/a/a/f0/c;->n:I

    if-eq v1, v3, :cond_3c

    .line 11
    iget-object v1, p0, Lc/a/a/a/f0/c;->h:Landroidx/transition/TransitionSet;

    invoke-static {p0, v1}, Lb/s/v;->a(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    .line 12
    :cond_3c
    iget v1, p0, Lc/a/a/a/f0/c;->l:I

    iget-object v3, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v3}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {p0, v1, v3}, Lc/a/a/a/f0/c;->a(II)Z

    move-result v1

    const/4 v3, 0x0

    :goto_4d
    if-ge v3, v0, :cond_7c

    .line 13
    iget-object v4, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    .line 14
    iget-object v4, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    aget-object v4, v4, v3

    iget v5, p0, Lc/a/a/a/f0/c;->l:I

    invoke-virtual {v4, v5}, Lc/a/a/a/f0/a;->setLabelVisibilityMode(I)V

    .line 15
    iget-object v4, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    aget-object v4, v4, v3

    invoke-virtual {v4, v1}, Lc/a/a/a/f0/a;->setShifting(Z)V

    .line 16
    iget-object v4, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    aget-object v4, v4, v3

    iget-object v5, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v5, v3}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    check-cast v5, Lb/b/p/j/i;

    invoke-virtual {v4, v5, v2}, Lc/a/a/a/f0/a;->a(Lb/b/p/j/i;I)V

    .line 17
    iget-object v4, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    invoke-virtual {v4, v2}, Lcom/google/android/material/navigation/NavigationBarPresenter;->b(Z)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_4d

    :cond_7c
    :goto_7c
    return-void
.end method

.method public c(I)V
    .registers 6

    .line 18
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_21

    .line 19
    iget-object v2, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    invoke-virtual {v2, v1}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 20
    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    if-ne p1, v3, :cond_1e

    .line 21
    iput p1, p0, Lc/a/a/a/f0/c;->n:I

    .line 22
    iput v1, p0, Lc/a/a/a/f0/c;->o:I

    const/4 p1, 0x1

    .line 23
    invoke-interface {v2, p1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_21

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_21
    :goto_21
    return-void
.end method

.method public getBadgeDrawables()Landroid/util/SparseArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    return-object v0
.end method

.method public getIconTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->p:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_f

    array-length v1, v0

    if-lez v1, :cond_f

    const/4 v1, 0x0

    .line 2
    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 3
    :cond_f
    iget-object v0, p0, Lc/a/a/a/f0/c;->v:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItemBackgroundRes()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->w:I

    return v0
.end method

.method public getItemIconSize()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->q:I

    return v0
.end method

.method public getItemTextAppearanceActive()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->u:I

    return v0
.end method

.method public getItemTextAppearanceInactive()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->t:I

    return v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->r:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getLabelVisibilityMode()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->l:I

    return v0
.end method

.method public getMenu()Lb/b/p/j/g;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    return-object v0
.end method

.method public getSelectedItemId()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->n:I

    return v0
.end method

.method public getSelectedItemPosition()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/f0/c;->o:I

    return v0
.end method

.method public getWindowAnimations()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-static {p1}, Lb/h/m/h0/c;->a(Landroid/view/accessibility/AccessibilityNodeInfo;)Lb/h/m/h0/c;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/c;->z:Lb/b/p/j/g;

    .line 4
    invoke-virtual {v0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 5
    invoke-static {v1, v0, v2, v1}, Lb/h/m/h0/c$b;->a(IIZI)Lb/h/m/h0/c$b;

    move-result-object v0

    .line 6
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public setBadgeDrawables(Landroid/util/SparseArray;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Lcom/google/android/material/badge/BadgeDrawable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c;->x:Landroid/util/SparseArray;

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_1c

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_1c

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getId()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/badge/BadgeDrawable;

    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setBadge(Lcom/google/android/material/badge/BadgeDrawable;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1c
    return-void
.end method

.method public setIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c;->p:Landroid/content/res/ColorStateList;

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_12

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setIconTintList(Landroid/content/res/ColorStateList;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c;->v:Landroid/graphics/drawable/Drawable;

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_12

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-void
.end method

.method public setItemBackgroundRes(I)V
    .registers 6

    .line 1
    iput p1, p0, Lc/a/a/a/f0/c;->w:I

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_12

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setItemBackground(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-void
.end method

.method public setItemIconSize(I)V
    .registers 6

    .line 1
    iput p1, p0, Lc/a/a/a/f0/c;->q:I

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_12

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setIconSize(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-void
.end method

.method public setItemTextAppearanceActive(I)V
    .registers 7

    .line 1
    iput p1, p0, Lc/a/a/a/f0/c;->u:I

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_19

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_19

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setTextAppearanceActive(I)V

    .line 5
    iget-object v4, p0, Lc/a/a/a/f0/c;->r:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_16

    .line 6
    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_19
    return-void
.end method

.method public setItemTextAppearanceInactive(I)V
    .registers 7

    .line 1
    iput p1, p0, Lc/a/a/a/f0/c;->t:I

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_19

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_19

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setTextAppearanceInactive(I)V

    .line 5
    iget-object v4, p0, Lc/a/a/a/f0/c;->r:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_16

    .line 6
    invoke-virtual {v3, v4}, Lc/a/a/a/f0/a;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_19
    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c;->r:Landroid/content/res/ColorStateList;

    .line 2
    iget-object v0, p0, Lc/a/a/a/f0/c;->m:[Lc/a/a/a/f0/a;

    if-eqz v0, :cond_12

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3, p1}, Lc/a/a/a/f0/a;->setTextColor(Landroid/content/res/ColorStateList;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-void
.end method

.method public setLabelVisibilityMode(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/f0/c;->l:I

    return-void
.end method

.method public setPresenter(Lcom/google/android/material/navigation/NavigationBarPresenter;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c;->y:Lcom/google/android/material/navigation/NavigationBarPresenter;

    return-void
.end method
