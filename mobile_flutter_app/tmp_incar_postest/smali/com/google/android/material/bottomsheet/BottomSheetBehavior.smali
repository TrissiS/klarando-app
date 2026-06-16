.class public Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
.source "BottomSheetBehavior.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;,
        Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;,
        Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
        "TV;>;"
    }
.end annotation


# static fields
.field public static final Y:I


# instance fields
.field public A:F

.field public B:I

.field public C:F

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:I

.field public H:Lb/j/a/c;

.field public I:Z

.field public J:I

.field public K:Z

.field public L:I

.field public M:I

.field public N:I

.field public O:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TV;>;"
        }
    .end annotation
.end field

.field public P:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final Q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;",
            ">;"
        }
    .end annotation
.end field

.field public R:Landroid/view/VelocityTracker;

.field public S:I

.field public T:I

.field public U:Z

.field public V:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public W:I

.field public final X:Lb/j/a/c$c;

.field public a:I

.field public b:Z

.field public c:Z

.field public d:F

.field public e:I

.field public f:Z

.field public g:I

.field public h:I

.field public i:Z

.field public j:Lc/a/a/a/l0/h;

.field public k:I

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:I

.field public s:I

.field public t:Lc/a/a/a/l0/m;

.field public u:Z

.field public v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
            "TV;>.h;"
        }
    .end annotation
.end field

.field public w:Landroid/animation/ValueAnimator;

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_Design_BottomSheet_Modal:I

    sput v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:I

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    .line 4
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c:Z

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    const/4 v2, 0x0

    .line 6
    iput-object v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    const/high16 v2, 0x3f000000    # 0.5f

    .line 7
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A:F

    const/high16 v2, -0x40800000    # -1.0f

    .line 8
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->C:F

    .line 9
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    const/4 v1, 0x4

    .line 10
    iput v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    .line 11
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    .line 12
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->W:I

    .line 13
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$e;

    invoke-direct {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$e;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->X:Lb/j/a/c$c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11

    .line 14
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    .line 17
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c:Z

    const/4 v2, -0x1

    .line 18
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    const/4 v3, 0x0

    .line 19
    iput-object v3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    const/high16 v3, 0x3f000000    # 0.5f

    .line 20
    iput v3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A:F

    const/high16 v4, -0x40800000    # -1.0f

    .line 21
    iput v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->C:F

    .line 22
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    const/4 v5, 0x4

    .line 23
    iput v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    .line 24
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    .line 25
    iput v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->W:I

    .line 26
    new-instance v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$e;

    invoke-direct {v5, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$e;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    iput-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->X:Lb/j/a/c$c;

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lc/a/a/a/d;->mtrl_min_touch_target_size:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h:I

    .line 28
    sget-object v5, Lc/a/a/a/l;->BottomSheetBehavior_Layout:[I

    invoke-virtual {p1, p2, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 29
    sget v6, Lc/a/a/a/l;->BottomSheetBehavior_Layout_shapeAppearance:I

    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    iput-boolean v6, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i:Z

    .line 30
    sget v6, Lc/a/a/a/l;->BottomSheetBehavior_Layout_backgroundTint:I

    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_5a

    .line 31
    sget v7, Lc/a/a/a/l;->BottomSheetBehavior_Layout_backgroundTint:I

    .line 32
    invoke-static {p1, v5, v7}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v7

    .line 33
    invoke-virtual {p0, p1, p2, v6, v7}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/content/Context;Landroid/util/AttributeSet;ZLandroid/content/res/ColorStateList;)V

    goto :goto_5d

    .line 34
    :cond_5a
    invoke-virtual {p0, p1, p2, v6}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/content/Context;Landroid/util/AttributeSet;Z)V

    .line 35
    :goto_5d
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e()V

    .line 36
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt p2, v6, :cond_6e

    .line 37
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_android_elevation:I

    invoke-virtual {v5, p2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    iput p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->C:F

    .line 38
    :cond_6e
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_android_maxWidth:I

    invoke-virtual {v5, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_7f

    .line 39
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_android_maxWidth:I

    .line 40
    invoke-virtual {v5, p2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    .line 41
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d(I)V

    .line 42
    :cond_7f
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_peekHeight:I

    invoke-virtual {v5, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p2

    if-eqz p2, :cond_8f

    .line 43
    iget p2, p2, Landroid/util/TypedValue;->data:I

    if-ne p2, v2, :cond_8f

    .line 44
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e(I)V

    goto :goto_98

    .line 45
    :cond_8f
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_peekHeight:I

    .line 46
    invoke-virtual {v5, p2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    .line 47
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e(I)V

    .line 48
    :goto_98
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_hideable:I

    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d(Z)V

    .line 49
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_gestureInsetBottomIgnored:I

    .line 50
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    .line 51
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c(Z)V

    .line 52
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_fitToContents:I

    .line 53
    invoke-virtual {v5, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    .line 54
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b(Z)V

    .line 55
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_skipCollapsed:I

    .line 56
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    .line 57
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e(Z)V

    .line 58
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_draggable:I

    invoke-virtual {v5, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Z)V

    .line 59
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_saveFlags:I

    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f(I)V

    .line 60
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_halfExpandedRatio:I

    .line 61
    invoke-virtual {v5, p2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    .line 62
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(F)V

    .line 63
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_expandedOffset:I

    invoke-virtual {v5, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p2

    if-eqz p2, :cond_eb

    .line 64
    iget v2, p2, Landroid/util/TypedValue;->type:I

    const/16 v3, 0x10

    if-ne v2, v3, :cond_eb

    .line 65
    iget p2, p2, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c(I)V

    goto :goto_f4

    .line 66
    :cond_eb
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_behavior_expandedOffset:I

    .line 67
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p2

    .line 68
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c(I)V

    .line 69
    :goto_f4
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_paddingBottomSystemWindowInsets:I

    .line 70
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Z

    .line 71
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_paddingLeftSystemWindowInsets:I

    .line 72
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->o:Z

    .line 73
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_paddingRightSystemWindowInsets:I

    .line 74
    invoke-virtual {v5, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Z

    .line 75
    sget p2, Lc/a/a/a/l;->BottomSheetBehavior_Layout_paddingTopSystemWindowInsets:I

    .line 76
    invoke-virtual {v5, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    .line 77
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 78
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 79
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d:F

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I
    .registers 2

    .line 2
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->s:I

    return p1
.end method

.method public static synthetic a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Lc/a/a/a/l0/h;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Z)V
    .registers 2

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g(Z)V

    return-void
.end method

.method public static synthetic b(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I
    .registers 2

    .line 2
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:I

    return p1
.end method

.method public static synthetic b(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I
    .registers 2

    .line 2
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->l:I

    return p1
.end method

.method public static synthetic d(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->E:Z

    return p0
.end method

.method public static synthetic e(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Z

    return p0
.end method

.method public static synthetic f(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:I

    return p0
.end method

.method public static synthetic g(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->o:Z

    return p0
.end method

.method public static synthetic h(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Z

    return p0
.end method

.method public static synthetic i(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;II)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;II)I"
        }
    .end annotation

    .line 208
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 209
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(I)Lb/h/m/h0/f;

    move-result-object p3

    .line 210
    invoke-static {p1, p2, p3}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/CharSequence;Lb/h/m/h0/f;)I

    move-result p1

    return p1
.end method

.method public a(Landroid/view/View;)Landroid/view/View;
    .registers 5

    .line 169
    invoke-static {p1}, Lb/h/m/y;->L(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p1

    .line 170
    :cond_7
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_22

    .line 171
    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 172
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_12
    if-ge v0, v1, :cond_22

    .line 173
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1f

    return-object v2

    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_22
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a(I)Lb/h/m/h0/f;
    .registers 3

    .line 211
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$f;

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$f;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)V

    return-object v0
.end method

.method public a()V
    .registers 2

    .line 13
    invoke-super {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a()V

    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    .line 15
    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    return-void
.end method

.method public a(F)V
    .registers 3

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-lez v0, :cond_15

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gez v0, :cond_15

    .line 151
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A:F

    .line 152
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_14

    .line 153
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c()V

    :cond_14
    return-void

    .line 154
    :cond_15
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ratio must be a float value between 0 and 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(IZ)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p1, v2, :cond_c

    .line 145
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    if-nez p1, :cond_15

    .line 146
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    goto :goto_1f

    .line 147
    :cond_c
    iget-boolean v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    if-nez v2, :cond_17

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    if-eq v2, p1, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    goto :goto_1f

    .line 148
    :cond_17
    :goto_17
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    .line 149
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    :goto_1f
    if-eqz v0, :cond_24

    .line 150
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g(Z)V

    :cond_24
    return-void
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;Z)V
    .registers 5

    const/4 v0, 0x0

    .line 174
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/content/Context;Landroid/util/AttributeSet;ZLandroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;ZLandroid/content/res/ColorStateList;)V
    .registers 7

    .line 175
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i:Z

    if-eqz v0, :cond_3f

    .line 176
    sget v0, Lc/a/a/a/b;->bottomSheetStyle:I

    sget v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:I

    .line 177
    invoke-static {p1, p2, v0, v1}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;

    move-result-object p2

    .line 178
    invoke-virtual {p2}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->t:Lc/a/a/a/l0/m;

    .line 179
    new-instance p2, Lc/a/a/a/l0/h;

    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->t:Lc/a/a/a/l0/m;

    invoke-direct {p2, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    iput-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    .line 180
    invoke-virtual {p2, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    if-eqz p3, :cond_28

    if-eqz p4, :cond_28

    .line 181
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    invoke-virtual {p1, p4}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    goto :goto_3f

    .line 182
    :cond_28
    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 183
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const p3, 0x1010031

    const/4 p4, 0x1

    invoke-virtual {p1, p3, p2, p4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 184
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    iget p2, p2, Landroid/util/TypedValue;->data:I

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/h;->setTint(I)V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 6

    const/4 v0, 0x3

    const/4 v1, 0x4

    if-ne p2, v1, :cond_7

    .line 185
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    goto :goto_29

    :cond_7
    const/4 v1, 0x6

    if-ne p2, v1, :cond_19

    .line 186
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    .line 187
    iget-boolean v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v2, :cond_17

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    if-gt v1, v2, :cond_17

    move v0, v2

    const/4 p2, 0x3

    goto :goto_29

    :cond_17
    move v0, v1

    goto :goto_29

    :cond_19
    if-ne p2, v0, :cond_20

    .line 188
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result v0

    goto :goto_29

    .line 189
    :cond_20
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz v0, :cond_2e

    const/4 v0, 0x5

    if-ne p2, v0, :cond_2e

    .line 190
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    :goto_29
    const/4 v1, 0x0

    .line 191
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;IIZ)V

    return-void

    .line 192
    :cond_2e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Illegal state argument: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroid/view/View;IIZ)V
    .registers 7

    .line 193
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    const/4 v1, 0x1

    if-eqz v0, :cond_1e

    if-eqz p4, :cond_12

    .line 194
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p4

    invoke-virtual {v0, p4, p3}, Lb/j/a/c;->e(II)Z

    move-result p3

    if-eqz p3, :cond_1e

    goto :goto_1c

    .line 195
    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p4

    invoke-virtual {v0, p1, p4, p3}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    move-result p3

    if-eqz p3, :cond_1e

    :goto_1c
    const/4 p3, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p3, 0x0

    :goto_1f
    if-eqz p3, :cond_4d

    const/4 p3, 0x2

    .line 196
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    .line 197
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j(I)V

    .line 198
    iget-object p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    if-nez p3, :cond_33

    .line 199
    new-instance p3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    invoke-direct {p3, p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Landroid/view/View;I)V

    iput-object p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    .line 200
    :cond_33
    iget-object p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    invoke-static {p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;)Z

    move-result p3

    if-nez p3, :cond_48

    .line 201
    iget-object p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    iput p2, p3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->j:I

    .line 202
    invoke-static {p1, p3}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 203
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    invoke-static {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;Z)Z

    goto :goto_50

    .line 204
    :cond_48
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;

    iput p2, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->j:I

    goto :goto_50

    .line 205
    :cond_4d
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    :goto_50
    return-void
.end method

.method public final a(Landroid/view/View;Lb/h/m/h0/c$a;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
            "Lb/h/m/h0/c$a;",
            "I)V"
        }
    .end annotation

    .line 206
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(I)Lb/h/m/h0/f;

    move-result-object p3

    const/4 v0, 0x0

    .line 207
    invoke-static {p1, p2, v0, p3}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/h0/c$a;Ljava/lang/CharSequence;Lb/h/m/h0/f;)V

    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;)V
    .registers 2

    .line 10
    invoke-super {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    .line 12
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/os/Parcelable;",
            ")V"
        }
    .end annotation

    .line 4
    check-cast p3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;

    .line 5
    invoke-virtual {p3}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, p1, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 6
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;)V

    .line 7
    iget p1, p3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;->j:I

    const/4 p2, 0x1

    if-eq p1, p2, :cond_18

    const/4 p2, 0x2

    if-ne p1, p2, :cond_15

    goto :goto_18

    .line 8
    :cond_15
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    goto :goto_1b

    :cond_18
    :goto_18
    const/4 p1, 0x4

    .line 9
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    :goto_1b
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "I)V"
        }
    .end annotation

    .line 109
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p4

    const/4 v0, 0x3

    if-ne p1, p4, :cond_f

    .line 110
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    return-void

    .line 111
    :cond_f
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_c9

    .line 112
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p3, p1, :cond_c9

    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    if-nez p1, :cond_1f

    goto/16 :goto_c9

    .line 113
    :cond_1f
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->J:I

    const/4 p3, 0x4

    const/4 p4, 0x6

    if-lez p1, :cond_3e

    .line 114
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz p1, :cond_2d

    .line 115
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    goto/16 :goto_c3

    .line 116
    :cond_2d
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    .line 117
    iget p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    if-le p1, p3, :cond_38

    move p1, p3

    goto/16 :goto_be

    .line 118
    :cond_38
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p1

    goto/16 :goto_c3

    .line 119
    :cond_3e
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz p1, :cond_51

    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g()F

    move-result p1

    invoke-virtual {p0, p2, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;F)Z

    move-result p1

    if-eqz p1, :cond_51

    .line 120
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    const/4 v0, 0x5

    goto/16 :goto_c3

    .line 121
    :cond_51
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->J:I

    if-nez p1, :cond_9f

    .line 122
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    .line 123
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v1, :cond_74

    .line 124
    iget p4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    sub-int p4, p1, p4

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p4

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-ge p4, p1, :cond_71

    .line 125
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    goto :goto_c3

    .line 126
    :cond_71
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    goto :goto_a5

    .line 127
    :cond_74
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    if-ge p1, v1, :cond_8a

    .line 128
    iget p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int p3, p1, p3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    if-ge p1, p3, :cond_87

    .line 129
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p1

    goto :goto_c3

    .line 130
    :cond_87
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    goto :goto_be

    :cond_8a
    sub-int v0, p1, v1

    .line 131
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-ge v0, p1, :cond_9c

    .line 132
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    goto :goto_be

    .line 133
    :cond_9c
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    goto :goto_a5

    .line 134
    :cond_9f
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz p1, :cond_a7

    .line 135
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    :goto_a5
    const/4 v0, 0x4

    goto :goto_c3

    .line 136
    :cond_a7
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    .line 137
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    sub-int v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-ge v0, p1, :cond_c0

    .line 138
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    :goto_be
    const/4 v0, 0x6

    goto :goto_c3

    .line 139
    :cond_c0
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    goto :goto_a5

    :goto_c3
    const/4 p3, 0x0

    .line 140
    invoke-virtual {p0, p2, v0, p1, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;IIZ)V

    .line 141
    iput-boolean p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    :cond_c9
    :goto_c9
    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIIII[I)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "IIIII[I)V"
        }
    .end annotation

    return-void
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "II[II)V"
        }
    .end annotation

    const/4 p1, 0x1

    if-ne p7, p1, :cond_4

    return-void

    .line 87
    :cond_4
    iget-object p4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    if-eqz p4, :cond_f

    invoke-virtual {p4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/view/View;

    goto :goto_10

    :cond_f
    const/4 p4, 0x0

    :goto_10
    if-eq p3, p4, :cond_13

    return-void

    .line 88
    :cond_13
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p4

    sub-int p7, p4, p5

    if-lez p5, :cond_42

    .line 89
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p3

    if-ge p7, p3, :cond_33

    .line 90
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p3

    sub-int/2addr p4, p3

    aput p4, p6, p1

    .line 91
    aget p3, p6, p1

    neg-int p3, p3

    invoke-static {p2, p3}, Lb/h/m/y;->e(Landroid/view/View;I)V

    const/4 p3, 0x3

    .line 92
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    goto :goto_70

    .line 93
    :cond_33
    iget-boolean p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    if-nez p3, :cond_38

    return-void

    .line 94
    :cond_38
    aput p5, p6, p1

    neg-int p3, p5

    .line 95
    invoke-static {p2, p3}, Lb/h/m/y;->e(Landroid/view/View;I)V

    .line 96
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    goto :goto_70

    :cond_42
    if-gez p5, :cond_70

    const/4 v0, -0x1

    .line 97
    invoke-virtual {p3, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p3

    if-nez p3, :cond_70

    .line 98
    iget p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    if-le p7, p3, :cond_62

    iget-boolean p7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz p7, :cond_54

    goto :goto_62

    :cond_54
    sub-int/2addr p4, p3

    .line 99
    aput p4, p6, p1

    .line 100
    aget p3, p6, p1

    neg-int p3, p3

    invoke-static {p2, p3}, Lb/h/m/y;->e(Landroid/view/View;I)V

    const/4 p3, 0x4

    .line 101
    invoke-virtual {p0, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    goto :goto_70

    .line 102
    :cond_62
    :goto_62
    iget-boolean p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    if-nez p3, :cond_67

    return-void

    .line 103
    :cond_67
    aput p5, p6, p1

    neg-int p3, p5

    .line 104
    invoke-static {p2, p3}, Lb/h/m/y;->e(Landroid/view/View;I)V

    .line 105
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    .line 106
    :cond_70
    :goto_70
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b(I)V

    .line 107
    iput p5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->J:I

    .line 108
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    return-void
.end method

.method public final a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;)V
    .registers 5

    .line 156
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, -0x1

    if-eq v0, v1, :cond_c

    const/4 v2, 0x1

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_10

    .line 157
    :cond_c
    iget v0, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;->k:I

    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    .line 158
    :cond_10
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    if-eq v0, v1, :cond_18

    const/4 v2, 0x2

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_1c

    .line 159
    :cond_18
    iget-boolean v0, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;->l:Z

    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    .line 160
    :cond_1c
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    if-eq v0, v1, :cond_24

    const/4 v2, 0x4

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_28

    .line 161
    :cond_24
    iget-boolean v0, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;->m:Z

    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    .line 162
    :cond_28
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    if-eq v0, v1, :cond_31

    const/16 v1, 0x8

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_35

    .line 163
    :cond_31
    iget-boolean p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;->n:Z

    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->E:Z

    :cond_35
    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 155
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    return-void
.end method

.method public a(Landroid/view/View;F)Z
    .registers 7

    .line 164
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->E:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    .line 165
    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    const/4 v3, 0x0

    if-ge v0, v2, :cond_10

    return v3

    .line 166
    :cond_10
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d()I

    move-result v0

    .line 167
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    int-to-float p1, p1

    const v2, 0x3dcccccd    # 0.1f

    mul-float p2, p2, v2

    add-float/2addr p1, p2

    .line 168
    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    int-to-float p2, p2

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    int-to-float p2, v0

    div-float/2addr p1, p2

    const/high16 p2, 0x3f000000    # 0.5f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_30

    goto :goto_31

    :cond_30
    const/4 v1, 0x0

    :goto_31
    return v1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;I)Z"
        }
    .end annotation

    .line 16
    invoke-static {p1}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_10

    invoke-static {p2}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 17
    invoke-virtual {p2, v1}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 18
    :cond_10
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-nez v0, :cond_85

    .line 19
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v4, Lc/a/a/a/d;->design_bottom_sheet_peek_height_min:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g:I

    .line 20
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b(Landroid/view/View;)V

    .line 21
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    .line 22
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i:Z

    if-eqz v0, :cond_37

    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_37

    .line 23
    invoke-static {p2, v0}, Lb/h/m/y;->a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 24
    :cond_37
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_5e

    .line 25
    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->C:F

    const/high16 v5, -0x40800000    # -1.0f

    cmpl-float v5, v4, v5

    if-nez v5, :cond_47

    .line 26
    invoke-static {p2}, Lb/h/m/y;->m(Landroid/view/View;)F

    move-result v4

    .line 27
    :cond_47
    invoke-virtual {v0, v4}, Lc/a/a/a/l0/h;->b(F)V

    .line 28
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-ne v0, v2, :cond_50

    const/4 v0, 0x1

    goto :goto_51

    :cond_50
    const/4 v0, 0x0

    :goto_51
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:Z

    .line 29
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_59

    const/4 v0, 0x0

    goto :goto_5b

    :cond_59
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_5b
    invoke-virtual {v4, v0}, Lc/a/a/a/l0/h;->c(F)V

    .line 30
    :cond_5e
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j()V

    .line 31
    invoke-static {p2}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_6a

    .line 32
    invoke-static {p2, v1}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 33
    :cond_6a
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 34
    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    if-le v0, v4, :cond_85

    const/4 v0, -0x1

    if-eq v4, v0, :cond_85

    .line 35
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 36
    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 37
    new-instance v4, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$a;

    invoke-direct {v4, p0, p2, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$a;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p2, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 38
    :cond_85
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-nez v0, :cond_91

    .line 39
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->X:Lb/j/a/c$c;

    invoke-static {p1, v0}, Lb/j/a/c;->a(Landroid/view/ViewGroup;Lb/j/a/c$c;)Lb/j/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    .line 40
    :cond_91
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    .line 41
    invoke-virtual {p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;I)V

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result p3

    iput p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M:I

    .line 43
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    .line 44
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L:I

    .line 45
    iget p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    sub-int p1, p3, p1

    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->s:I

    if-ge p1, v4, :cond_bc

    .line 46
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    if-eqz p1, :cond_b9

    .line 47
    iput p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L:I

    goto :goto_bc

    :cond_b9
    sub-int/2addr p3, v4

    .line 48
    iput p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L:I

    .line 49
    :cond_bc
    :goto_bc
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    iget p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L:I

    sub-int/2addr p1, p3

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    .line 50
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c()V

    .line 51
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b()V

    .line 52
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-ne p1, v2, :cond_d9

    .line 53
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result p1

    invoke-static {p2, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    goto :goto_107

    :cond_d9
    const/4 p3, 0x6

    if-ne p1, p3, :cond_e2

    .line 54
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    invoke-static {p2, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    goto :goto_107

    .line 55
    :cond_e2
    iget-boolean p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz p3, :cond_ef

    const/4 p3, 0x5

    if-ne p1, p3, :cond_ef

    .line 56
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    invoke-static {p2, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    goto :goto_107

    .line 57
    :cond_ef
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 p3, 0x4

    if-ne p1, p3, :cond_fa

    .line 58
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    invoke-static {p2, p1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    goto :goto_107

    :cond_fa
    if-eq p1, v1, :cond_ff

    const/4 p3, 0x2

    if-ne p1, p3, :cond_107

    .line 59
    :cond_ff
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p1

    sub-int/2addr v0, p1

    invoke-static {p2, v0}, Lb/h/m/y;->e(Landroid/view/View;I)V

    .line 60
    :cond_107
    :goto_107
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    return v1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 61
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_d2

    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->F:Z

    if-nez v0, :cond_e

    goto/16 :goto_d2

    .line 62
    :cond_e
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_17

    .line 63
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i()V

    .line 64
    :cond_17
    iget-object v3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    if-nez v3, :cond_21

    .line 65
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    .line 66
    :cond_21
    iget-object v3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    invoke-virtual {v3, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, 0x2

    if-eqz v0, :cond_3c

    if-eq v0, v2, :cond_31

    const/4 p2, 0x3

    if-eq v0, p2, :cond_31

    goto :goto_7f

    .line 67
    :cond_31
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->U:Z

    .line 68
    iput v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->S:I

    .line 69
    iget-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    if-eqz p2, :cond_7f

    .line 70
    iput-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    return v1

    .line 71
    :cond_3c
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    float-to-int v6, v6

    .line 72
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T:I

    .line 73
    iget v7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-eq v7, v5, :cond_6e

    .line 74
    iget-object v7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    if-eqz v7, :cond_57

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    goto :goto_58

    :cond_57
    move-object v7, v3

    :goto_58
    if-eqz v7, :cond_6e

    .line 75
    iget v8, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T:I

    invoke-virtual {p1, v7, v6, v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result v7

    if-eqz v7, :cond_6e

    .line 76
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v7

    invoke-virtual {p3, v7}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->S:I

    .line 77
    iput-boolean v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->U:Z

    .line 78
    :cond_6e
    iget v7, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->S:I

    if-ne v7, v4, :cond_7c

    iget v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T:I

    .line 79
    invoke-virtual {p1, p2, v6, v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result p2

    if-nez p2, :cond_7c

    const/4 p2, 0x1

    goto :goto_7d

    :cond_7c
    const/4 p2, 0x0

    :goto_7d
    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    .line 80
    :cond_7f
    :goto_7f
    iget-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    if-nez p2, :cond_8e

    iget-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-eqz p2, :cond_8e

    .line 81
    invoke-virtual {p2, p3}, Lb/j/a/c;->c(Landroid/view/MotionEvent;)Z

    move-result p2

    if-eqz p2, :cond_8e

    return v2

    .line 82
    :cond_8e
    iget-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_99

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/view/View;

    :cond_99
    if-ne v0, v5, :cond_d1

    if-eqz v3, :cond_d1

    .line 83
    iget-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    if-nez p2, :cond_d1

    iget p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-eq p2, v2, :cond_d1

    .line 84
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1, v3, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result p1

    if-nez p1, :cond_d1

    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-eqz p1, :cond_d1

    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T:I

    int-to-float p1, p1

    .line 85
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    invoke-virtual {p2}, Lb/j/a/c;->e()I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_d1

    const/4 v1, 0x1

    :cond_d1
    return v1

    .line 86
    :cond_d2
    :goto_d2
    iput-boolean v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    return v1
.end method

.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "FF)Z"
        }
    .end annotation

    .line 142
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 143
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne p3, v0, :cond_17

    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_16

    .line 144
    invoke-super/range {p0 .. p5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z

    move-result p1

    if-eqz p1, :cond_17

    :cond_16
    const/4 v1, 0x1

    :cond_17
    return v1
.end method

.method public final b()V
    .registers 3

    .line 24
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d()I

    move-result v0

    .line 25
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v1, :cond_14

    .line 26
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    sub-int/2addr v1, v0

    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    goto :goto_19

    .line 27
    :cond_14
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    :goto_19
    return-void
.end method

.method public b(I)V
    .registers 5

    .line 32
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_4a

    .line 33
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4a

    .line 34
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    if-gt p1, v1, :cond_29

    .line 35
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result v2

    if-ne v1, v2, :cond_1d

    goto :goto_29

    :cond_1d
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int p1, v1, p1

    int-to-float p1, p1

    .line 36
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    goto :goto_32

    .line 37
    :cond_29
    :goto_29
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->B:I

    sub-int p1, v1, p1

    int-to-float p1, p1

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    sub-int/2addr v2, v1

    int-to-float v1, v2

    :goto_32
    div-float/2addr p1, v1

    const/4 v1, 0x0

    .line 38
    :goto_34
    iget-object v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4a

    .line 39
    iget-object v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;

    invoke-virtual {v2, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;->a(Landroid/view/View;F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    :cond_4a
    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 4

    .line 28
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_12

    .line 29
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h()Z

    move-result v0

    if-nez v0, :cond_12

    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    .line 30
    :goto_13
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Z

    if-nez v1, :cond_22

    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->o:Z

    if-nez v1, :cond_22

    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Z

    if-nez v1, :cond_22

    if-nez v0, :cond_22

    return-void

    .line 31
    :cond_22
    new-instance v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;

    invoke-direct {v1, p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Z)V

    invoke-static {p1, v1}, Lc/a/a/a/d0/t;->a(Landroid/view/View;Lc/a/a/a/d0/t$e;)V

    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 18
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-ne v0, p1, :cond_5

    return-void

    .line 19
    :cond_5
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    .line 20
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_e

    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b()V

    .line 22
    :cond_e
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz p1, :cond_19

    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v0, 0x6

    if-ne p1, v0, :cond_19

    const/4 p1, 0x3

    goto :goto_1b

    :cond_19
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    :goto_1b
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j()V

    return-void
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 3
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p1, 0x0

    return p1

    .line 4
    :cond_8
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 5
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    if-nez p1, :cond_14

    return v1

    .line 6
    :cond_14
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-eqz v0, :cond_1b

    .line 7
    invoke-virtual {v0, p3}, Lb/j/a/c;->a(Landroid/view/MotionEvent;)V

    :cond_1b
    if-nez p1, :cond_20

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i()V

    .line 9
    :cond_20
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    if-nez v0, :cond_2a

    .line 10
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    .line 11
    :cond_2a
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-eqz v0, :cond_5e

    const/4 v0, 0x2

    if-ne p1, v0, :cond_5e

    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    if-nez p1, :cond_5e

    .line 13
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T:I

    int-to-float p1, p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    invoke-virtual {v0}, Lb/j/a/c;->e()I

    move-result v0

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_5e

    .line 14
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lb/j/a/c;->a(Landroid/view/View;I)V

    .line 15
    :cond_5e
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->I:Z

    xor-int/2addr p1, v1

    return p1
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "II)Z"
        }
    .end annotation

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->J:I

    .line 17
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    and-int/lit8 p2, p5, 0x2

    if-eqz p2, :cond_a

    const/4 p1, 0x1

    :cond_a
    return p1
.end method

.method public final c()V
    .registers 4

    .line 6
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    int-to-float v0, v0

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->A:F

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v1

    mul-float v0, v0, v2

    float-to-int v0, v0

    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->z:I

    return-void
.end method

.method public c(I)V
    .registers 3

    if-ltz p1, :cond_5

    .line 3
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->x:I

    return-void

    .line 4
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "offset must be greater than or equal to 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public c(Z)V
    .registers 2

    .line 5
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Z

    return-void
.end method

.method public final d()I
    .registers 4

    .line 9
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f:Z

    if-eqz v0, :cond_1d

    .line 10
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g:I

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N:I

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0x10

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 11
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:I

    add-int/2addr v0, v1

    return v0

    .line 12
    :cond_1d
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Z

    if-nez v0, :cond_33

    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:Z

    if-nez v0, :cond_33

    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->l:I

    if-lez v0, :cond_33

    .line 13
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h:I

    add-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    .line 14
    :cond_33
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e:I

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:I

    add-int/2addr v0, v1

    return v0
.end method

.method public d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;)",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    .line 2
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;

    invoke-super {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$SavedState;-><init>(Landroid/os/Parcelable;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    return-object v0
.end method

.method public d(I)V
    .registers 2

    .line 3
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->k:I

    return-void
.end method

.method public d(Z)V
    .registers 3

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eq v0, p1, :cond_14

    .line 5
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-nez p1, :cond_11

    .line 6
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v0, 0x5

    if-ne p1, v0, :cond_11

    const/4 p1, 0x4

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g(I)V

    .line 8
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j()V

    :cond_14
    return-void
.end method

.method public final e()V
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 4
    fill-array-data v0, :array_1c

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x1f4

    .line 5
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 6
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$c;

    invoke-direct {v1, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$c;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void

    :array_1c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public e(I)V
    .registers 3

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(IZ)V

    return-void
.end method

.method public e(Z)V
    .registers 2

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->E:Z

    return-void
.end method

.method public f()I
    .registers 3

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->y:I

    goto :goto_15

    :cond_7
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->x:I

    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    if-eqz v1, :cond_f

    const/4 v1, 0x0

    goto :goto_11

    :cond_f
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->s:I

    .line 3
    :goto_11
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_15
    return v0
.end method

.method public f(I)V
    .registers 2

    .line 4
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a:I

    return-void
.end method

.method public final f(Z)V
    .registers 9

    .line 5
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_5

    return-void

    .line 6
    :cond_5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 7
    instance-of v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    if-nez v1, :cond_14

    return-void

    .line 8
    :cond_14
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 10
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2f

    if-eqz p1, :cond_2f

    .line 11
    iget-object v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    if-nez v2, :cond_2e

    .line 12
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    goto :goto_2f

    :cond_2e
    return-void

    :cond_2f
    :goto_2f
    const/4 v2, 0x0

    :goto_30
    if-ge v2, v1, :cond_7b

    .line 13
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 14
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-ne v4, v5, :cond_3f

    goto :goto_78

    :cond_3f
    if-eqz p1, :cond_5b

    .line 15
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v3, :cond_52

    .line 16
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    invoke-virtual {v4}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    :cond_52
    iget-boolean v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c:Z

    if-eqz v5, :cond_78

    const/4 v5, 0x4

    .line 18
    invoke-static {v4, v5}, Lb/h/m/y;->h(Landroid/view/View;I)V

    goto :goto_78

    .line 19
    :cond_5b
    iget-boolean v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c:Z

    if-eqz v5, :cond_78

    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    if-eqz v5, :cond_78

    .line 20
    invoke-interface {v5, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_78

    .line 21
    iget-object v5, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v4, v5}, Lb/h/m/y;->h(Landroid/view/View;I)V

    :cond_78
    :goto_78
    add-int/lit8 v2, v2, 0x1

    goto :goto_30

    :cond_7b
    if-nez p1, :cond_81

    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->V:Ljava/util/Map;

    goto :goto_92

    .line 23
    :cond_81
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c:Z

    if-eqz p1, :cond_92

    .line 24
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_92
    :goto_92
    return-void
.end method

.method public final g()F
    .registers 4

    .line 13
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    const/16 v1, 0x3e8

    .line 14
    iget v2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->d:F

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 15
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->S:I

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v0

    return v0
.end method

.method public g(I)V
    .registers 3

    .line 8
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-ne p1, v0, :cond_5

    return-void

    .line 9
    :cond_5
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_1c

    const/4 v0, 0x4

    if-eq p1, v0, :cond_19

    const/4 v0, 0x3

    if-eq p1, v0, :cond_19

    const/4 v0, 0x6

    if-eq p1, v0, :cond_19

    .line 10
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz v0, :cond_1b

    const/4 v0, 0x5

    if-ne p1, v0, :cond_1b

    .line 11
    :cond_19
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    :cond_1b
    return-void

    .line 12
    :cond_1c
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i(I)V

    return-void
.end method

.method public final g(Z)V
    .registers 4

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_21

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b()V

    .line 4
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_21

    .line 5
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_21

    if-eqz p1, :cond_1e

    .line 6
    iget p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->i(I)V

    goto :goto_21

    .line 7
    :cond_1e
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    :cond_21
    :goto_21
    return-void
.end method

.method public h(I)V
    .registers 5

    .line 3
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-ne v0, p1, :cond_5

    return-void

    .line 4
    :cond_5
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    .line 5
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_c

    return-void

    .line 6
    :cond_c
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_15

    return-void

    :cond_15
    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne p1, v1, :cond_1e

    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f(Z)V

    goto :goto_2a

    :cond_1e
    const/4 v1, 0x6

    if-eq p1, v1, :cond_27

    const/4 v1, 0x5

    if-eq p1, v1, :cond_27

    const/4 v1, 0x4

    if-ne p1, v1, :cond_2a

    .line 8
    :cond_27
    invoke-virtual {p0, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f(Z)V

    .line 9
    :cond_2a
    :goto_2a
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j(I)V

    .line 10
    :goto_2d
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v2, v1, :cond_43

    .line 11
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Q:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;

    invoke-virtual {v1, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;->a(Landroid/view/View;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 12
    :cond_43
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j()V

    return-void
.end method

.method public h()Z
    .registers 2

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->m:Z

    return v0
.end method

.method public final i()V
    .registers 2

    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->S:I

    .line 8
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_d

    .line 9
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->R:Landroid/view/VelocityTracker;

    :cond_d
    return-void
.end method

.method public final i(I)V
    .registers 4

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    .line 3
    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_26

    .line 4
    invoke-interface {v1}, Landroid/view/ViewParent;->isLayoutRequested()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 5
    new-instance v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$b;

    invoke-direct {v1, p0, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$b;-><init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Landroid/view/View;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_29

    .line 6
    :cond_26
    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;I)V

    :goto_29
    return-void
.end method

.method public final j()V
    .registers 6

    .line 8
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->O:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_5

    return-void

    .line 9
    :cond_5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_e

    return-void

    :cond_e
    const/high16 v1, 0x80000

    .line 10
    invoke-static {v0, v1}, Lb/h/m/y;->f(Landroid/view/View;I)V

    const/high16 v1, 0x40000

    .line 11
    invoke-static {v0, v1}, Lb/h/m/y;->f(Landroid/view/View;I)V

    const/high16 v1, 0x100000

    .line 12
    invoke-static {v0, v1}, Lb/h/m/y;->f(Landroid/view/View;I)V

    .line 13
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->W:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_25

    .line 14
    invoke-static {v0, v1}, Lb/h/m/y;->f(Landroid/view/View;I)V

    .line 15
    :cond_25
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    const/4 v2, 0x6

    if-nez v1, :cond_36

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    if-eq v1, v2, :cond_36

    .line 16
    sget v1, Lc/a/a/a/j;->bottomsheet_action_expand_halfway:I

    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;II)I

    move-result v1

    iput v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->W:I

    .line 18
    :cond_36
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D:Z

    if-eqz v1, :cond_44

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v3, 0x5

    if-eq v1, v3, :cond_44

    .line 19
    sget-object v1, Lb/h/m/h0/c$a;->l:Lb/h/m/h0/c$a;

    invoke-virtual {p0, v0, v1, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;Lb/h/m/h0/c$a;I)V

    .line 20
    :cond_44
    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->G:I

    const/4 v3, 0x4

    const/4 v4, 0x3

    if-eq v1, v4, :cond_65

    if-eq v1, v3, :cond_5a

    if-eq v1, v2, :cond_4f

    goto :goto_6f

    .line 21
    :cond_4f
    sget-object v1, Lb/h/m/h0/c$a;->k:Lb/h/m/h0/c$a;

    invoke-virtual {p0, v0, v1, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;Lb/h/m/h0/c$a;I)V

    .line 22
    sget-object v1, Lb/h/m/h0/c$a;->j:Lb/h/m/h0/c$a;

    invoke-virtual {p0, v0, v1, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;Lb/h/m/h0/c$a;I)V

    goto :goto_6f

    .line 23
    :cond_5a
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v1, :cond_5f

    const/4 v2, 0x3

    .line 24
    :cond_5f
    sget-object v1, Lb/h/m/h0/c$a;->j:Lb/h/m/h0/c$a;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;Lb/h/m/h0/c$a;I)V

    goto :goto_6f

    .line 25
    :cond_65
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b:Z

    if-eqz v1, :cond_6a

    const/4 v2, 0x4

    .line 26
    :cond_6a
    sget-object v1, Lb/h/m/h0/c$a;->k:Lb/h/m/h0/c$a;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Landroid/view/View;Lb/h/m/h0/c$a;I)V

    :goto_6f
    return-void
.end method

.method public final j(I)V
    .registers 7

    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    return-void

    :cond_4
    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p1, v1, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    .line 1
    :goto_c
    iget-boolean v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:Z

    if-eq v1, p1, :cond_3f

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:Z

    .line 3
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lc/a/a/a/l0/h;

    if-eqz v1, :cond_3f

    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_3f

    .line 4
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 5
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->reverse()V

    goto :goto_3f

    :cond_26
    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p1, :cond_2c

    const/4 p1, 0x0

    goto :goto_2e

    :cond_2c
    const/high16 p1, 0x3f800000    # 1.0f

    :goto_2e
    sub-float/2addr v1, p1

    .line 6
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    new-array v0, v0, [F

    aput v1, v0, v3

    aput p1, v0, v2

    invoke-virtual {v4, v0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 7
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_3f
    :goto_3f
    return-void
.end method
