.class public Landroidx/viewpager/widget/ViewPager;
.super Landroid/view/ViewGroup;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/viewpager/widget/ViewPager$l;,
        Landroidx/viewpager/widget/ViewPager$LayoutParams;,
        Landroidx/viewpager/widget/ViewPager$k;,
        Landroidx/viewpager/widget/ViewPager$g;,
        Landroidx/viewpager/widget/ViewPager$SavedState;,
        Landroidx/viewpager/widget/ViewPager$e;,
        Landroidx/viewpager/widget/ViewPager$h;,
        Landroidx/viewpager/widget/ViewPager$j;,
        Landroidx/viewpager/widget/ViewPager$i;,
        Landroidx/viewpager/widget/ViewPager$f;
    }
.end annotation


# static fields
.field public static final m0:[I

.field public static final n0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public static final o0:Landroid/view/animation/Interpolator;

.field public static final p0:Landroidx/viewpager/widget/ViewPager$l;


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:I

.field public E:Z

.field public F:Z

.field public G:I

.field public H:I

.field public I:I

.field public J:F

.field public K:F

.field public L:F

.field public M:F

.field public N:I

.field public O:Landroid/view/VelocityTracker;

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:Z

.field public U:Landroid/widget/EdgeEffect;

.field public V:Landroid/widget/EdgeEffect;

.field public W:Z

.field public a0:Z

.field public b0:I

.field public c0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$i;",
            ">;"
        }
    .end annotation
.end field

.field public d0:Landroidx/viewpager/widget/ViewPager$i;

.field public e0:Landroidx/viewpager/widget/ViewPager$i;

.field public f0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$h;",
            ">;"
        }
    .end annotation
.end field

.field public g0:Landroidx/viewpager/widget/ViewPager$j;

.field public h:I

.field public h0:I

.field public final i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public i0:I

.field public final j:Landroidx/viewpager/widget/ViewPager$f;

.field public j0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Landroid/graphics/Rect;

.field public final k0:Ljava/lang/Runnable;

.field public l:Lb/v/a/a;

.field public l0:I

.field public m:I

.field public n:I

.field public o:Landroid/os/Parcelable;

.field public p:Ljava/lang/ClassLoader;

.field public q:Landroid/widget/Scroller;

.field public r:Z

.field public s:Landroidx/viewpager/widget/ViewPager$k;

.field public t:I

.field public u:Landroid/graphics/drawable/Drawable;

.field public v:I

.field public w:I

.field public x:F

.field public y:F

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100b3

    aput v2, v0, v1

    .line 1
    sput-object v0, Landroidx/viewpager/widget/ViewPager;->m0:[I

    .line 2
    new-instance v0, Landroidx/viewpager/widget/ViewPager$a;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$a;-><init>()V

    sput-object v0, Landroidx/viewpager/widget/ViewPager;->n0:Ljava/util/Comparator;

    .line 3
    new-instance v0, Landroidx/viewpager/widget/ViewPager$b;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$b;-><init>()V

    sput-object v0, Landroidx/viewpager/widget/ViewPager;->o0:Landroid/view/animation/Interpolator;

    .line 4
    new-instance v0, Landroidx/viewpager/widget/ViewPager$l;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$l;-><init>()V

    sput-object v0, Landroidx/viewpager/widget/ViewPager;->p0:Landroidx/viewpager/widget/ViewPager$l;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    .line 3
    new-instance p1, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {p1}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->j:Landroidx/viewpager/widget/ViewPager$f;

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    const/4 p1, -0x1

    .line 5
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->o:Landroid/os/Parcelable;

    .line 7
    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->p:Ljava/lang/ClassLoader;

    const v0, -0x800001

    .line 8
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 9
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    const/4 v0, 0x1

    .line 10
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    .line 11
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    .line 12
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    .line 13
    new-instance p1, Landroidx/viewpager/widget/ViewPager$c;

    invoke-direct {p1, p0}, Landroidx/viewpager/widget/ViewPager$c;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k0:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 14
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->l0:I

    .line 15
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    .line 18
    new-instance p1, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {p1}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->j:Landroidx/viewpager/widget/ViewPager$f;

    .line 19
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    const/4 p1, -0x1

    .line 20
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    const/4 p2, 0x0

    .line 21
    iput-object p2, p0, Landroidx/viewpager/widget/ViewPager;->o:Landroid/os/Parcelable;

    .line 22
    iput-object p2, p0, Landroidx/viewpager/widget/ViewPager;->p:Ljava/lang/ClassLoader;

    const p2, -0x800001

    .line 23
    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    const p2, 0x7f7fffff    # Float.MAX_VALUE

    .line 24
    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    const/4 p2, 0x1

    .line 25
    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    .line 26
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    .line 27
    iput-boolean p2, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    .line 28
    new-instance p1, Landroidx/viewpager/widget/ViewPager$c;

    invoke-direct {p1, p0}, Landroidx/viewpager/widget/ViewPager$c;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k0:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->l0:I

    .line 30
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->d()V

    return-void
.end method

.method public static c(Landroid/view/View;)Z
    .registers 2

    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    .line 4
    const-class v0, Landroidx/viewpager/widget/ViewPager$e;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    return p0
.end method

.method private getClientWidth()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private setScrollingCacheEnabled(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->B:Z

    if-eq v0, p1, :cond_6

    .line 2
    iput-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->B:Z

    :cond_6
    return-void
.end method


# virtual methods
.method public a(F)F
    .registers 4

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    const v0, 0x3ef1463b

    mul-float p1, p1, v0

    float-to-double v0, p1

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public final a(IFII)I
    .registers 6

    .line 182
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p4

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->R:I

    if-le p4, v0, :cond_16

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p4

    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->P:I

    if-le p4, v0, :cond_16

    if-lez p3, :cond_13

    goto :goto_24

    :cond_13
    add-int/lit8 p1, p1, 0x1

    goto :goto_24

    .line 183
    :cond_16
    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-lt p1, p3, :cond_1e

    const p3, 0x3ecccccd    # 0.4f

    goto :goto_21

    :cond_1e
    const p3, 0x3f19999a    # 0.6f

    :goto_21
    add-float/2addr p2, p3

    float-to-int p2, p2

    add-int/2addr p1, p2

    .line 184
    :goto_24
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_4f

    .line 185
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/viewpager/widget/ViewPager$f;

    .line 186
    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/viewpager/widget/ViewPager$f;

    .line 187
    iget p2, p2, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget p3, p3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :cond_4f
    return p1
.end method

.method public final a(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 5

    if-nez p1, :cond_7

    .line 242
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    :cond_7
    if-nez p2, :cond_e

    const/4 p2, 0x0

    .line 243
    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/graphics/Rect;->set(IIII)V

    return-object p1

    .line 244
    :cond_e
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 245
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 246
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 247
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 248
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    .line 249
    :goto_2a
    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5b

    if-eq p2, p0, :cond_5b

    .line 250
    check-cast p2, Landroid/view/ViewGroup;

    .line 251
    iget v0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getLeft()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 252
    iget v0, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getRight()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 253
    iget v0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTop()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 254
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getBottom()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 255
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    goto :goto_2a

    :cond_5b
    return-object p1
.end method

.method public a(II)Landroidx/viewpager/widget/ViewPager$f;
    .registers 5

    .line 64
    new-instance v0, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    .line 65
    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->b:I

    .line 66
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, p0, p1}, Lb/v/a/a;->a(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    .line 67
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, p1}, Lb/v/a/a;->b(I)F

    move-result p1

    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->d:F

    if-ltz p2, :cond_28

    .line 68
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p2, p1, :cond_22

    goto :goto_28

    .line 69
    :cond_22
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2d

    .line 70
    :cond_28
    :goto_28
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2d
    return-object v0
.end method

.method public a(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;
    .registers 3

    .line 139
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eq v0, p0, :cond_13

    if-eqz v0, :cond_11

    .line 140
    instance-of p1, v0, Landroid/view/View;

    if-nez p1, :cond_d

    goto :goto_11

    .line 141
    :cond_d
    move-object p1, v0

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_11
    :goto_11
    const/4 p1, 0x0

    return-object p1

    .line 142
    :cond_13
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .registers 11

    .line 71
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    .line 72
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->h:I

    .line 73
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    mul-int/lit8 v2, v2, 0x2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    const/4 v4, 0x0

    if-ge v1, v2, :cond_21

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    .line 74
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v0, :cond_21

    const/4 v1, 0x1

    goto :goto_22

    :cond_21
    const/4 v1, 0x0

    .line 75
    :goto_22
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 76
    :goto_26
    iget-object v7, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_7e

    .line 77
    iget-object v7, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/viewpager/widget/ViewPager$f;

    .line 78
    iget-object v8, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v9, v7, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v8, v9}, Lb/v/a/a;->a(Ljava/lang/Object;)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_42

    goto :goto_7c

    :cond_42
    const/4 v9, -0x2

    if-ne v8, v9, :cond_70

    .line 79
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v5, v5, -0x1

    if-nez v6, :cond_54

    .line 80
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, p0}, Lb/v/a/a;->b(Landroid/view/ViewGroup;)V

    const/4 v6, 0x1

    .line 81
    :cond_54
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget v8, v7, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v9, v7, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v1, p0, v8, v9}, Lb/v/a/a;->a(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 82
    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    iget v7, v7, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v1, v7, :cond_6e

    add-int/lit8 v2, v0, -0x1

    .line 83
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v2, v1

    :cond_6e
    :goto_6e
    const/4 v1, 0x1

    goto :goto_7c

    .line 84
    :cond_70
    iget v9, v7, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-eq v9, v8, :cond_7c

    .line 85
    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v9, v1, :cond_79

    move v2, v8

    .line 86
    :cond_79
    iput v8, v7, Landroidx/viewpager/widget/ViewPager$f;->b:I

    goto :goto_6e

    :cond_7c
    :goto_7c
    add-int/2addr v5, v3

    goto :goto_26

    :cond_7e
    if-eqz v6, :cond_85

    .line 87
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0, p0}, Lb/v/a/a;->a(Landroid/view/ViewGroup;)V

    .line 88
    :cond_85
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    sget-object v5, Landroidx/viewpager/widget/ViewPager;->n0:Ljava/util/Comparator;

    invoke-static {v0, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    if-eqz v1, :cond_af

    .line 89
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_93
    if-ge v1, v0, :cond_a9

    .line 90
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 91
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 92
    iget-boolean v6, v5, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v6, :cond_a6

    const/4 v6, 0x0

    .line 93
    iput v6, v5, Landroidx/viewpager/widget/ViewPager$LayoutParams;->c:F

    :cond_a6
    add-int/lit8 v1, v1, 0x1

    goto :goto_93

    .line 94
    :cond_a9
    invoke-virtual {p0, v2, v4, v3}, Landroidx/viewpager/widget/ViewPager;->a(IZZ)V

    .line 95
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_af
    return-void
.end method

.method public final a(IFI)V
    .registers 7

    .line 156
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->d0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_7

    .line 157
    invoke-interface {v0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$i;->a(IFI)V

    .line 158
    :cond_7
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    if-eqz v0, :cond_22

    const/4 v1, 0x0

    .line 159
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_10
    if-ge v1, v0, :cond_22

    .line 160
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v2, :cond_1f

    .line 161
    invoke-interface {v2, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$i;->a(IFI)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 162
    :cond_22
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_29

    .line 163
    invoke-interface {v0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$i;->a(IFI)V

    :cond_29
    return-void
.end method

.method public a(III)V
    .registers 13

    .line 39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_b

    .line 40
    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void

    .line 41
    :cond_b
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    const/4 v2, 0x1

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    if-eqz v0, :cond_35

    .line 42
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->r:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    goto :goto_2c

    :cond_26
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getStartX()I

    move-result v0

    .line 43
    :goto_2c
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->abortAnimation()V

    .line 44
    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_39

    .line 45
    :cond_35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    :goto_39
    move v4, v0

    .line 46
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v5

    sub-int v6, p1, v4

    sub-int v7, p2, v5

    if-nez v6, :cond_50

    if-nez v7, :cond_50

    .line 47
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    .line 48
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    .line 49
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    return-void

    .line 50
    :cond_50
    invoke-direct {p0, v2}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    const/4 p1, 0x2

    .line 51
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    .line 52
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result p1

    .line 53
    div-int/lit8 p2, p1, 0x2

    .line 54
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v0, v0, v2

    int-to-float p1, p1

    div-float/2addr v0, p1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    int-to-float p2, p2

    .line 55
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->a(F)F

    move-result v0

    mul-float v0, v0, p2

    add-float/2addr p2, v0

    .line 56
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    if-lez p3, :cond_8b

    const/high16 p1, 0x447a0000    # 1000.0f

    int-to-float p3, p3

    div-float/2addr p2, p3

    .line 57
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    mul-float p2, p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x4

    goto :goto_a5

    .line 58
    :cond_8b
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p2, p3}, Lb/v/a/a;->b(I)F

    move-result p2

    mul-float p1, p1, p2

    .line 59
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result p2

    int-to-float p2, p2

    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float p3, p3

    add-float/2addr p1, p3

    div-float/2addr p2, p1

    add-float/2addr p2, v2

    const/high16 p1, 0x42c80000    # 100.0f

    mul-float p2, p2, p1

    float-to-int p1, p2

    :goto_a5
    const/16 p2, 0x258

    .line 60
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 61
    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->r:Z

    .line 62
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual/range {v3 .. v8}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 63
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public final a(IIII)V
    .registers 6

    if-lez p2, :cond_4b

    .line 143
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    .line 144
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_22

    .line 145
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result p2

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result p3

    mul-int p2, p2, p3

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    goto :goto_7c

    .line 146
    :cond_22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v0

    sub-int/2addr p1, v0

    add-int/2addr p1, p3

    .line 147
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result p3

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p3

    sub-int/2addr p2, p3

    add-int/2addr p2, p4

    .line 148
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result p3

    int-to-float p3, p3

    int-to-float p2, p2

    div-float/2addr p3, p2

    int-to-float p1, p1

    mul-float p3, p3, p1

    float-to-int p1, p3

    .line 149
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    goto :goto_7c

    .line 150
    :cond_4b
    iget p2, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p0, p2}, Landroidx/viewpager/widget/ViewPager;->d(I)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object p2

    if-eqz p2, :cond_5c

    .line 151
    iget p2, p2, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    move-result p2

    goto :goto_5d

    :cond_5c
    const/4 p2, 0x0

    .line 152
    :goto_5d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result p3

    sub-int/2addr p1, p3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p3

    sub-int/2addr p1, p3

    int-to-float p1, p1

    mul-float p2, p2, p1

    float-to-int p1, p2

    .line 153
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result p2

    if-eq p1, p2, :cond_7c

    const/4 p2, 0x0

    .line 154
    invoke-virtual {p0, p2}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    .line 155
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    :cond_7c
    :goto_7c
    return-void
.end method

.method public a(IZ)V
    .registers 4

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 5
    invoke-virtual {p0, p1, p2, v0}, Landroidx/viewpager/widget/ViewPager;->a(IZZ)V

    return-void
.end method

.method public final a(IZIZ)V
    .registers 10

    .line 24
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->d(I)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    .line 25
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v2

    int-to-float v2, v2

    .line 26
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    iget v0, v0, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    .line 27
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 28
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    mul-float v2, v2, v0

    float-to-int v0, v2

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    if-eqz p2, :cond_2a

    .line 29
    invoke-virtual {p0, v0, v1, p3}, Landroidx/viewpager/widget/ViewPager;->a(III)V

    if-eqz p4, :cond_38

    .line 30
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(I)V

    goto :goto_38

    :cond_2a
    if-eqz p4, :cond_2f

    .line 31
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(I)V

    .line 32
    :cond_2f
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    .line 33
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 34
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->e(I)Z

    :cond_38
    :goto_38
    return-void
.end method

.method public a(IZZ)V
    .registers 5

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/viewpager/widget/ViewPager;->a(IZZI)V

    return-void
.end method

.method public a(IZZI)V
    .registers 9

    .line 7
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_6e

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    if-gtz v0, :cond_c

    goto :goto_6e

    :cond_c
    if-nez p3, :cond_1e

    .line 8
    iget p3, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne p3, p1, :cond_1e

    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-eqz p3, :cond_1e

    .line 9
    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void

    :cond_1e
    const/4 p3, 0x1

    if-gez p1, :cond_23

    const/4 p1, 0x0

    goto :goto_32

    .line 10
    :cond_23
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    if-lt p1, v0, :cond_32

    .line 11
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {p1}, Lb/v/a/a;->a()I

    move-result p1

    sub-int/2addr p1, p3

    .line 12
    :cond_32
    :goto_32
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    .line 13
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    add-int v3, v2, v0

    if-gt p1, v3, :cond_3d

    sub-int/2addr v2, v0

    if-ge p1, v2, :cond_53

    :cond_3d
    const/4 v0, 0x0

    .line 14
    :goto_3e
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_53

    .line 15
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$f;

    iput-boolean p3, v2, Landroidx/viewpager/widget/ViewPager$f;->c:Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_3e

    .line 16
    :cond_53
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-eq v0, p1, :cond_58

    const/4 v1, 0x1

    .line 17
    :cond_58
    iget-boolean p3, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    if-eqz p3, :cond_67

    .line 18
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-eqz v1, :cond_63

    .line 19
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(I)V

    .line 20
    :cond_63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    goto :goto_6d

    .line 21
    :cond_67
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->f(I)V

    .line 22
    invoke-virtual {p0, p1, p2, p4, v1}, Landroidx/viewpager/widget/ViewPager;->a(IZIZ)V

    :goto_6d
    return-void

    .line 23
    :cond_6e
    :goto_6e
    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void
.end method

.method public final a(Landroid/view/MotionEvent;)V
    .registers 5

    .line 188
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 189
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 190
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    if-ne v1, v2, :cond_24

    if-nez v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    .line 191
    :goto_11
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    iput v1, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 192
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    .line 193
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_24

    .line 194
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    :cond_24
    return-void
.end method

.method public final a(Landroidx/viewpager/widget/ViewPager$f;ILandroidx/viewpager/widget/ViewPager$f;)V
    .registers 13

    .line 96
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    .line 97
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v1

    if-lez v1, :cond_12

    .line 98
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v2, v2

    int-to-float v1, v1

    div-float/2addr v2, v1

    goto :goto_13

    :cond_12
    const/4 v2, 0x0

    :goto_13
    if-eqz p3, :cond_ac

    .line 99
    iget v1, p3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    .line 100
    iget v3, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ge v1, v3, :cond_67

    const/4 v3, 0x0

    .line 101
    iget v4, p3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget p3, p3, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v4, p3

    add-float/2addr v4, v2

    :goto_22
    add-int/lit8 v1, v1, 0x1

    .line 102
    iget p3, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-gt v1, p3, :cond_ac

    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge v3, p3, :cond_ac

    .line 103
    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/viewpager/widget/ViewPager$f;

    .line 104
    :goto_38
    iget v5, p3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-le v1, v5, :cond_51

    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v3, v5, :cond_51

    add-int/lit8 v3, v3, 0x1

    .line 105
    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_38

    .line 106
    :cond_51
    :goto_51
    iget v5, p3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ge v1, v5, :cond_60

    .line 107
    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v5, v1}, Lb/v/a/a;->b(I)F

    move-result v5

    add-float/2addr v5, v2

    add-float/2addr v4, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 108
    :cond_60
    iput v4, p3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 109
    iget p3, p3, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr p3, v2

    add-float/2addr v4, p3

    goto :goto_22

    :cond_67
    if-le v1, v3, :cond_ac

    .line 110
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .line 111
    iget p3, p3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    add-int/lit8 v1, v1, -0x1

    .line 112
    :goto_75
    iget v4, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-lt v1, v4, :cond_ac

    if-ltz v3, :cond_ac

    .line 113
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/viewpager/widget/ViewPager$f;

    .line 114
    :goto_83
    iget v5, v4, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ge v1, v5, :cond_94

    if-lez v3, :cond_94

    add-int/lit8 v3, v3, -0x1

    .line 115
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_83

    .line 116
    :cond_94
    :goto_94
    iget v5, v4, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-le v1, v5, :cond_a3

    .line 117
    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v5, v1}, Lb/v/a/a;->b(I)F

    move-result v5

    add-float/2addr v5, v2

    sub-float/2addr p3, v5

    add-int/lit8 v1, v1, -0x1

    goto :goto_94

    .line 118
    :cond_a3
    iget v5, v4, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v5, v2

    sub-float/2addr p3, v5

    .line 119
    iput p3, v4, Landroidx/viewpager/widget/ViewPager$f;->e:F

    add-int/lit8 v1, v1, -0x1

    goto :goto_75

    .line 120
    :cond_ac
    iget-object p3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    .line 121
    iget v1, p1, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 122
    iget v3, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    add-int/lit8 v4, v3, -0x1

    if-nez v3, :cond_bc

    move v3, v1

    goto :goto_bf

    :cond_bc
    const v3, -0x800001

    .line 123
    :goto_bf
    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    .line 124
    iget v3, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    add-int/lit8 v0, v0, -0x1

    const/high16 v5, 0x3f800000    # 1.0f

    if-ne v3, v0, :cond_d0

    iget v3, p1, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget v6, p1, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v3, v6

    sub-float/2addr v3, v5

    goto :goto_d3

    :cond_d0
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    :goto_d3
    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    add-int/lit8 v3, p2, -0x1

    :goto_d7
    if-ltz v3, :cond_100

    .line 125
    iget-object v6, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/viewpager/widget/ViewPager$f;

    .line 126
    :goto_e1
    iget v7, v6, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-le v4, v7, :cond_f1

    .line 127
    iget-object v7, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    add-int/lit8 v8, v4, -0x1

    invoke-virtual {v7, v4}, Lb/v/a/a;->b(I)F

    move-result v4

    add-float/2addr v4, v2

    sub-float/2addr v1, v4

    move v4, v8

    goto :goto_e1

    .line 128
    :cond_f1
    iget v8, v6, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v8, v2

    sub-float/2addr v1, v8

    .line 129
    iput v1, v6, Landroidx/viewpager/widget/ViewPager$f;->e:F

    if-nez v7, :cond_fb

    .line 130
    iput v1, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    :cond_fb
    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v4, v4, -0x1

    goto :goto_d7

    .line 131
    :cond_100
    iget v1, p1, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget v3, p1, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v1, v3

    add-float/2addr v1, v2

    .line 132
    iget p1, p1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, 0x1

    :goto_10c
    if-ge p2, p3, :cond_139

    .line 133
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$f;

    .line 134
    :goto_116
    iget v4, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ge p1, v4, :cond_126

    .line 135
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    add-int/lit8 v6, p1, 0x1

    invoke-virtual {v4, p1}, Lb/v/a/a;->b(I)F

    move-result p1

    add-float/2addr p1, v2

    add-float/2addr v1, p1

    move p1, v6

    goto :goto_116

    :cond_126
    if-ne v4, v0, :cond_12e

    .line 136
    iget v4, v3, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v4, v1

    sub-float/2addr v4, v5

    iput v4, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    .line 137
    :cond_12e
    iput v1, v3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 138
    iget v3, v3, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v3, v2

    add-float/2addr v1, v3

    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_10c

    :cond_139
    return-void
.end method

.method public a(Landroidx/viewpager/widget/ViewPager$h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    .line 3
    :cond_b
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Landroidx/viewpager/widget/ViewPager$i;)V
    .registers 3

    .line 35
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    if-nez v0, :cond_b

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    .line 37
    :cond_b
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Z)V
    .registers 9

    .line 164
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->l0:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    if-eqz v0, :cond_3d

    .line 165
    invoke-direct {p0, v2}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 166
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->isFinished()Z

    move-result v3

    xor-int/2addr v3, v1

    if-eqz v3, :cond_3d

    .line 167
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->abortAnimation()V

    .line 168
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v3

    .line 169
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v4

    .line 170
    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getCurrX()I

    move-result v5

    .line 171
    iget-object v6, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->getCurrY()I

    move-result v6

    if-ne v3, v5, :cond_35

    if-eq v4, v6, :cond_3d

    .line 172
    :cond_35
    invoke-virtual {p0, v5, v6}, Landroid/view/ViewGroup;->scrollTo(II)V

    if-eq v5, v3, :cond_3d

    .line 173
    invoke-virtual {p0, v5}, Landroidx/viewpager/widget/ViewPager;->e(I)Z

    .line 174
    :cond_3d
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    const/4 v3, 0x0

    .line 175
    :goto_40
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_5a

    .line 176
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/viewpager/widget/ViewPager$f;

    .line 177
    iget-boolean v5, v4, Landroidx/viewpager/widget/ViewPager$f;->c:Z

    if-eqz v5, :cond_57

    .line 178
    iput-boolean v2, v4, Landroidx/viewpager/widget/ViewPager$f;->c:Z

    const/4 v0, 0x1

    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_40

    :cond_5a
    if-eqz v0, :cond_69

    if-eqz p1, :cond_64

    .line 179
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k0:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_69

    .line 180
    :cond_64
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->k0:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_69
    :goto_69
    return-void
.end method

.method public final a(FF)Z
    .registers 6

    .line 181
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    int-to-float v0, v0

    const/4 v1, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_c

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_1c

    :cond_c
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1e

    cmpg-float p1, p2, v1

    if-gez p1, :cond_1e

    :cond_1c
    const/4 p1, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    return p1
.end method

.method public a(I)Z
    .registers 8

    .line 219
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-ne v0, p0, :cond_b

    :goto_9
    move-object v0, v3

    goto :goto_69

    :cond_b
    if-eqz v0, :cond_69

    .line 220
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    :goto_11
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_1e

    if-ne v4, p0, :cond_19

    const/4 v4, 0x1

    goto :goto_1f

    .line 221
    :cond_19
    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    goto :goto_11

    :cond_1e
    const/4 v4, 0x0

    :goto_1f
    if-nez v4, :cond_69

    .line 222
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_35
    instance-of v5, v0, Landroid/view/ViewGroup;

    if-eqz v5, :cond_4e

    const-string v5, " => "

    .line 225
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_35

    .line 227
    :cond_4e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "arrowScroll tried to find focus based on non-child current focused view "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "ViewPager"

    .line 229
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 230
    :cond_69
    :goto_69
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v3

    invoke-virtual {v3, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x42

    const/16 v5, 0x11

    if-eqz v3, :cond_ba

    if-eq v3, v0, :cond_ba

    if-ne p1, v5, :cond_9a

    .line 231
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    invoke-virtual {p0, v1, v3}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 232
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    invoke-virtual {p0, v2, v0}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    if-eqz v0, :cond_94

    if-lt v1, v2, :cond_94

    .line 233
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->e()Z

    move-result v0

    goto :goto_98

    .line 234
    :cond_94
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    move-result v0

    :goto_98
    move v2, v0

    goto :goto_cd

    :cond_9a
    if-ne p1, v4, :cond_cd

    .line 235
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    invoke-virtual {p0, v1, v3}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 236
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->k:Landroid/graphics/Rect;

    invoke-virtual {p0, v2, v0}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    if-eqz v0, :cond_b5

    if-gt v1, v2, :cond_b5

    .line 237
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->f()Z

    move-result v0

    goto :goto_98

    .line 238
    :cond_b5
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    move-result v0

    goto :goto_98

    :cond_ba
    if-eq p1, v5, :cond_c9

    if-ne p1, v1, :cond_bf

    goto :goto_c9

    :cond_bf
    if-eq p1, v4, :cond_c4

    const/4 v0, 0x2

    if-ne p1, v0, :cond_cd

    .line 239
    :cond_c4
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->f()Z

    move-result v2

    goto :goto_cd

    .line 240
    :cond_c9
    :goto_c9
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->e()Z

    move-result v2

    :cond_cd
    :goto_cd
    if-eqz v2, :cond_d6

    .line 241
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->playSoundEffect(I)V

    :cond_d6
    return v2
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 5

    .line 207
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_53

    .line 208
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x15

    const/4 v2, 0x2

    if-eq v0, v1, :cond_41

    const/16 v1, 0x16

    if-eq v0, v1, :cond_2f

    const/16 v1, 0x3d

    if-eq v0, v1, :cond_18

    goto :goto_53

    .line 209
    :cond_18
    invoke-virtual {p1}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 210
    invoke-virtual {p0, v2}, Landroidx/viewpager/widget/ViewPager;->a(I)Z

    move-result p1

    goto :goto_54

    :cond_23
    const/4 v0, 0x1

    .line 211
    invoke-virtual {p1, v0}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result p1

    if-eqz p1, :cond_53

    .line 212
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->a(I)Z

    move-result p1

    goto :goto_54

    .line 213
    :cond_2f
    invoke-virtual {p1, v2}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result p1

    if-eqz p1, :cond_3a

    .line 214
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->f()Z

    move-result p1

    goto :goto_54

    :cond_3a
    const/16 p1, 0x42

    .line 215
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->a(I)Z

    move-result p1

    goto :goto_54

    .line 216
    :cond_41
    invoke-virtual {p1, v2}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result p1

    if-eqz p1, :cond_4c

    .line 217
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->e()Z

    move-result p1

    goto :goto_54

    :cond_4c
    const/16 p1, 0x11

    .line 218
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->a(I)Z

    move-result p1

    goto :goto_54

    :cond_53
    :goto_53
    const/4 p1, 0x0

    :goto_54
    return p1
.end method

.method public a(Landroid/view/View;ZIII)Z
    .registers 18

    move-object v0, p1

    .line 195
    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_52

    .line 196
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 197
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v3

    .line 198
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v4

    .line 199
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    sub-int/2addr v5, v2

    :goto_16
    if-ltz v5, :cond_52

    .line 200
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    add-int v6, p4, v3

    .line 201
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    if-lt v6, v8, :cond_4f

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v6, v8, :cond_4f

    add-int v8, p5, v4

    .line 202
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v9

    if-lt v8, v9, :cond_4f

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v9

    if-ge v8, v9, :cond_4f

    const/4 v9, 0x1

    .line 203
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v10

    sub-int v10, v6, v10

    .line 204
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v6

    sub-int v11, v8, v6

    move-object v6, p0

    move v8, v9

    move v9, p3

    .line 205
    invoke-virtual/range {v6 .. v11}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/View;ZIII)Z

    move-result v6

    if-eqz v6, :cond_4f

    return v2

    :cond_4f
    add-int/lit8 v5, v5, -0x1

    goto :goto_16

    :cond_52
    if-eqz p2, :cond_5d

    move v1, p3

    neg-int v1, v1

    .line 206
    invoke-virtual {p1, v1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    if-eqz v0, :cond_5d

    goto :goto_5e

    :cond_5d
    const/4 v2, 0x0

    :goto_5e
    return v2
.end method

.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    move-result v1

    const/high16 v2, 0x60000

    if-eq v1, v2, :cond_2f

    const/4 v2, 0x0

    .line 3
    :goto_d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_2f

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2c

    .line 6
    invoke-virtual {p0, v3}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v4

    if-eqz v4, :cond_2c

    .line 7
    iget v4, v4, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v4, v5, :cond_2c

    .line 8
    invoke-virtual {v3, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_2f
    const/high16 p2, 0x40000

    if-ne v1, p2, :cond_39

    .line 9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ne v0, p2, :cond_56

    .line 10
    :cond_39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isFocusable()Z

    move-result p2

    if-nez p2, :cond_40

    return-void

    :cond_40
    const/4 p2, 0x1

    and-int/2addr p3, p2

    if-ne p3, p2, :cond_51

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInTouchMode()Z

    move-result p2

    if-eqz p2, :cond_51

    invoke-virtual {p0}, Landroid/view/ViewGroup;->isFocusableInTouchMode()Z

    move-result p2

    if-nez p2, :cond_51

    return-void

    :cond_51
    if-eqz p1, :cond_56

    .line 12
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_56
    return-void
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_23

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_20

    .line 4
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v2

    if-eqz v2, :cond_20

    .line 5
    iget v2, v2, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v2, v3, :cond_20

    .line 6
    invoke-virtual {v1, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_23
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    .line 1
    invoke-virtual {p0, p3}, Landroidx/viewpager/widget/ViewPager;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 2
    invoke-virtual {p0, p3}, Landroidx/viewpager/widget/ViewPager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    .line 3
    :cond_a
    move-object v0, p3

    check-cast v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 4
    iget-boolean v1, v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    invoke-static {p1}, Landroidx/viewpager/widget/ViewPager;->c(Landroid/view/View;)Z

    move-result v2

    or-int/2addr v1, v2

    iput-boolean v1, v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    .line 5
    iget-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->A:Z

    if-eqz v2, :cond_2e

    if-eqz v0, :cond_27

    if-nez v1, :cond_1f

    goto :goto_27

    .line 6
    :cond_1f
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot add pager decor view during layout"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_27
    :goto_27
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;->d:Z

    .line 8
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    goto :goto_31

    .line 9
    :cond_2e
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_31
    return-void
.end method

.method public b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;
    .registers 6

    const/4 v0, 0x0

    .line 5
    :goto_1
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 6
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/viewpager/widget/ViewPager$f;

    .line 7
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v3, v1, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Lb/v/a/a;->a(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    return-object v1

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1f
    const/4 p1, 0x0

    return-object p1
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x0

    .line 62
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    .line 63
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->F:Z

    .line 64
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_f

    .line 65
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    .line 66
    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    :cond_f
    return-void
.end method

.method public final b(I)V
    .registers 5

    .line 34
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->d0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_7

    .line 35
    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$i;->b(I)V

    .line 36
    :cond_7
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    if-eqz v0, :cond_22

    const/4 v1, 0x0

    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_10
    if-ge v1, v0, :cond_22

    .line 38
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v2, :cond_1f

    .line 39
    invoke-interface {v2, p1}, Landroidx/viewpager/widget/ViewPager$i;->b(I)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 40
    :cond_22
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_29

    .line 41
    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$i;->b(I)V

    :cond_29
    return-void
.end method

.method public b(IFI)V
    .registers 16

    .line 8
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->b0:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_6b

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v3

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v4

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v5

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    const/4 v7, 0x0

    :goto_1b
    if-ge v7, v6, :cond_6b

    .line 14
    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 15
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 16
    iget-boolean v10, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v10, :cond_2c

    goto :goto_68

    .line 17
    :cond_2c
    iget v9, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->b:I

    and-int/lit8 v9, v9, 0x7

    if-eq v9, v2, :cond_4d

    const/4 v10, 0x3

    if-eq v9, v10, :cond_47

    const/4 v10, 0x5

    if-eq v9, v10, :cond_3a

    move v9, v3

    goto :goto_5c

    :cond_3a
    sub-int v9, v5, v4

    .line 18
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    sub-int/2addr v9, v10

    .line 19
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v4, v10

    goto :goto_59

    .line 20
    :cond_47
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v9, v3

    goto :goto_5c

    .line 21
    :cond_4d
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    sub-int v9, v5, v9

    div-int/lit8 v9, v9, 0x2

    invoke-static {v9, v3}, Ljava/lang/Math;->max(II)I

    move-result v9

    :goto_59
    move v11, v9

    move v9, v3

    move v3, v11

    :goto_5c
    add-int/2addr v3, v0

    .line 22
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v10

    sub-int/2addr v3, v10

    if-eqz v3, :cond_67

    .line 23
    invoke-virtual {v8, v3}, Landroid/view/View;->offsetLeftAndRight(I)V

    :cond_67
    move v3, v9

    :goto_68
    add-int/lit8 v7, v7, 0x1

    goto :goto_1b

    .line 24
    :cond_6b
    invoke-virtual {p0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager;->a(IFI)V

    .line 25
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->g0:Landroidx/viewpager/widget/ViewPager$j;

    if-eqz p1, :cond_9f

    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result p1

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    :goto_7a
    if-ge v1, p2, :cond_9f

    .line 28
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    .line 29
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 30
    iget-boolean v0, v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-eqz v0, :cond_8b

    goto :goto_9c

    .line 31
    :cond_8b
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v0

    sub-int/2addr v0, p1

    int-to-float v0, v0

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v0, v3

    .line 32
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->g0:Landroidx/viewpager/widget/ViewPager$j;

    invoke-interface {v3, p3, v0}, Landroidx/viewpager/widget/ViewPager$j;->a(Landroid/view/View;F)V

    :goto_9c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7a

    .line 33
    :cond_9f
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->a0:Z

    return-void
.end method

.method public b(Landroidx/viewpager/widget/ViewPager$h;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    if-eqz v0, :cond_7

    .line 2
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public b(Landroidx/viewpager/widget/ViewPager$i;)V
    .registers 3

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    if-eqz v0, :cond_7

    .line 4
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public final b(Z)V
    .registers 8

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_19

    if-eqz p1, :cond_d

    .line 43
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->h0:I

    goto :goto_e

    :cond_d
    const/4 v3, 0x0

    .line 44
    :goto_e
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_19
    return-void
.end method

.method public final b(F)Z
    .registers 11

    .line 45
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    sub-float/2addr v0, p1

    .line 46
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v0

    .line 48
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v0

    int-to-float v0, v0

    .line 49
    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    mul-float v1, v1, v0

    .line 50
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    mul-float v2, v2, v0

    .line 51
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$f;

    .line 52
    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    sub-int/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    .line 53
    iget v6, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-eqz v6, :cond_39

    .line 54
    iget v1, v3, Landroidx/viewpager/widget/ViewPager$f;->e:F

    mul-float v1, v1, v0

    const/4 v3, 0x0

    goto :goto_3a

    :cond_39
    const/4 v3, 0x1

    .line 55
    :goto_3a
    iget v6, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v8, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v8}, Lb/v/a/a;->a()I

    move-result v8

    sub-int/2addr v8, v7

    if-eq v6, v8, :cond_4b

    .line 56
    iget v2, v5, Landroidx/viewpager/widget/ViewPager$f;->e:F

    mul-float v2, v2, v0

    const/4 v5, 0x0

    goto :goto_4c

    :cond_4b
    const/4 v5, 0x1

    :goto_4c
    cmpg-float v6, p1, v1

    if-gez v6, :cond_61

    if-eqz v3, :cond_5f

    sub-float p1, v1, p1

    .line 57
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    div-float/2addr p1, v0

    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->onPull(F)V

    const/4 v4, 0x1

    :cond_5f
    move p1, v1

    goto :goto_74

    :cond_61
    cmpl-float v1, p1, v2

    if-lez v1, :cond_74

    if-eqz v5, :cond_73

    sub-float/2addr p1, v2

    .line 58
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    div-float/2addr p1, v0

    invoke-virtual {v1, p1}, Landroid/widget/EdgeEffect;->onPull(F)V

    const/4 v4, 0x1

    :cond_73
    move p1, v2

    .line 59
    :cond_74
    :goto_74
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    float-to-int v1, p1

    int-to-float v2, v1

    sub-float/2addr p1, v2

    add-float/2addr v0, p1

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 60
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 61
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->e(I)Z

    return v4
.end method

.method public final c()Landroidx/viewpager/widget/ViewPager$f;
    .registers 13

    .line 15
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_f

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    goto :goto_10

    :cond_f
    const/4 v2, 0x0

    :goto_10
    if-lez v0, :cond_18

    .line 17
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v3, v3

    int-to-float v0, v0

    div-float/2addr v3, v0

    goto :goto_19

    :cond_18
    const/4 v3, 0x0

    :goto_19
    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 18
    :goto_21
    iget-object v10, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v8, v10, :cond_70

    .line 19
    iget-object v10, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/viewpager/widget/ViewPager$f;

    if-nez v9, :cond_4a

    .line 20
    iget v11, v10, Landroidx/viewpager/widget/ViewPager$f;->b:I

    add-int/2addr v7, v6

    if-eq v11, v7, :cond_4a

    .line 21
    iget-object v10, p0, Landroidx/viewpager/widget/ViewPager;->j:Landroidx/viewpager/widget/ViewPager$f;

    add-float/2addr v1, v5

    add-float/2addr v1, v3

    .line 22
    iput v1, v10, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 23
    iput v7, v10, Landroidx/viewpager/widget/ViewPager$f;->b:I

    .line 24
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, v7}, Lb/v/a/a;->b(I)F

    move-result v1

    iput v1, v10, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-int/lit8 v8, v8, -0x1

    .line 25
    :cond_4a
    iget v1, v10, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 26
    iget v5, v10, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v5, v1

    add-float/2addr v5, v3

    if-nez v9, :cond_58

    cmpl-float v7, v2, v1

    if-ltz v7, :cond_57

    goto :goto_58

    :cond_57
    return-object v0

    :cond_58
    :goto_58
    cmpg-float v0, v2, v5

    if-ltz v0, :cond_6f

    .line 27
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v6

    if-ne v8, v0, :cond_66

    goto :goto_6f

    .line 28
    :cond_66
    iget v7, v10, Landroidx/viewpager/widget/ViewPager$f;->b:I

    .line 29
    iget v5, v10, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-int/lit8 v8, v8, 0x1

    move-object v0, v10

    const/4 v9, 0x0

    goto :goto_21

    :cond_6f
    :goto_6f
    return-object v10

    :cond_70
    return-object v0
.end method

.method public c(Landroidx/viewpager/widget/ViewPager$i;)Landroidx/viewpager/widget/ViewPager$i;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e0:Landroidx/viewpager/widget/ViewPager$i;

    .line 2
    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->e0:Landroidx/viewpager/widget/ViewPager$i;

    return-object v0
.end method

.method public final c(I)V
    .registers 5

    .line 5
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->d0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_7

    .line 6
    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$i;->a(I)V

    .line 7
    :cond_7
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    if-eqz v0, :cond_22

    const/4 v1, 0x0

    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_10
    if-ge v1, v0, :cond_22

    .line 9
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->c0:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v2, :cond_1f

    .line 10
    invoke-interface {v2, p1}, Landroidx/viewpager/widget/ViewPager$i;->a(I)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 11
    :cond_22
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->e0:Landroidx/viewpager/widget/ViewPager$i;

    if-eqz v0, :cond_29

    .line 12
    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$i;->a(I)V

    :cond_29
    return-void
.end method

.method public final c(Z)V
    .registers 3

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 14
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_9
    return-void
.end method

.method public canScrollHorizontally(I)Z
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v0

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v2

    const/4 v3, 0x1

    if-gez p1, :cond_1b

    int-to-float p1, v0

    .line 4
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    if-le v2, p1, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1

    :cond_1b
    if-lez p1, :cond_26

    int-to-float p1, v0

    .line 5
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    if-ge v2, p1, :cond_26

    const/4 v1, 0x1

    :cond_26
    return v1
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    .line 1
    instance-of v0, p1, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public computeScroll()V
    .registers 5

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->r:Z

    .line 2
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-nez v1, :cond_41

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    .line 5
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    .line 6
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    if-ne v0, v2, :cond_2b

    if-eq v1, v3, :cond_3d

    .line 7
    :cond_2b
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 8
    invoke-virtual {p0, v2}, Landroidx/viewpager/widget/ViewPager;->e(I)Z

    move-result v0

    if-nez v0, :cond_3d

    .line 9
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0, v3}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 11
    :cond_3d
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void

    .line 12
    :cond_41
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    return-void
.end method

.method public d(I)Landroidx/viewpager/widget/ViewPager$f;
    .registers 5

    const/4 v0, 0x0

    .line 20
    :goto_1
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    .line 21
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/viewpager/widget/ViewPager$f;

    .line 22
    iget v2, v1, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v2, p1, :cond_16

    return-object v1

    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_19
    const/4 p1, 0x0

    return-object p1
.end method

.method public d()V
    .registers 6

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    const/high16 v0, 0x40000

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 5
    new-instance v2, Landroid/widget/Scroller;

    sget-object v3, Landroidx/viewpager/widget/ViewPager;->o0:Landroid/view/animation/Interpolator;

    invoke-direct {v2, v1, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v2, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    .line 6
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 8
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v4

    iput v4, p0, Landroidx/viewpager/widget/ViewPager;->I:I

    const/high16 v4, 0x43c80000    # 400.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    .line 9
    iput v4, p0, Landroidx/viewpager/widget/ViewPager;->P:I

    .line 10
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v2

    iput v2, p0, Landroidx/viewpager/widget/ViewPager;->Q:I

    .line 11
    new-instance v2, Landroid/widget/EdgeEffect;

    invoke-direct {v2, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    .line 12
    new-instance v2, Landroid/widget/EdgeEffect;

    invoke-direct {v2, v1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    const/high16 v1, 0x41c80000    # 25.0f

    mul-float v1, v1, v3

    float-to-int v1, v1

    .line 13
    iput v1, p0, Landroidx/viewpager/widget/ViewPager;->R:I

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v1, v1, v3

    float-to-int v1, v1

    .line 14
    iput v1, p0, Landroidx/viewpager/widget/ViewPager;->S:I

    const/high16 v1, 0x41800000    # 16.0f

    mul-float v3, v3, v1

    float-to-int v1, v3

    .line 15
    iput v1, p0, Landroidx/viewpager/widget/ViewPager;->G:I

    .line 16
    new-instance v1, Landroidx/viewpager/widget/ViewPager$g;

    invoke-direct {v1, p0}, Landroidx/viewpager/widget/ViewPager$g;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    invoke-static {p0, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 17
    invoke-static {p0}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v1

    if-nez v1, :cond_6f

    .line 18
    invoke-static {p0, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 19
    :cond_6f
    new-instance v0, Landroidx/viewpager/widget/ViewPager$d;

    invoke-direct {v0, p0}, Landroidx/viewpager/widget/ViewPager$d;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_f

    :cond_d
    const/4 p1, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p1, 0x1

    :goto_10
    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 8

    .line 1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_d

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1

    .line 3
    :cond_d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v0, :cond_36

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_33

    .line 6
    invoke-virtual {p0, v3}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v4

    if-eqz v4, :cond_33

    .line 7
    iget v4, v4, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v4, v5, :cond_33

    .line 8
    invoke-virtual {v3, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v3

    if-eqz v3, :cond_33

    const/4 p1, 0x1

    return p1

    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_36
    return v1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getOverScrollMode()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    const/4 v2, 0x1

    if-ne v0, v2, :cond_18

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v0, :cond_18

    .line 4
    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    if-le v0, v2, :cond_18

    goto :goto_24

    .line 5
    :cond_18
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->finish()V

    .line 6
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {p1}, Landroid/widget/EdgeEffect;->finish()V

    goto/16 :goto_a9

    .line 7
    :cond_24
    :goto_24
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_65

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    const/high16 v4, 0x43870000    # 270.0f

    .line 11
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    neg-int v4, v2

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    int-to-float v4, v4

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->x:F

    int-to-float v6, v3

    mul-float v5, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 13
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {v4, v2, v3}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 14
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    move-result v2

    or-int/2addr v1, v2

    .line 15
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 16
    :cond_65
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_a9

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    const/high16 v4, 0x42b40000    # 90.0f

    .line 20
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->y:F

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    neg-float v5, v5

    int-to-float v6, v2

    mul-float v5, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 22
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {v4, v3, v2}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 23
    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    move-result v2

    or-int/2addr v1, v2

    .line 24
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_a9
    :goto_a9
    if-eqz v1, :cond_ae

    .line 25
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_ae
    return-void
.end method

.method public drawableStateChanged()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_14

    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_14
    return-void
.end method

.method public e()Z
    .registers 3

    .line 16
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-lez v0, :cond_a

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 17
    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->a(IZ)V

    return v1

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method public final e(I)Z
    .registers 9

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v1, "onPageScrolled did not call superclass implementation"

    const/4 v2, 0x0

    if-nez v0, :cond_21

    .line 2
    iget-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    if-eqz p1, :cond_10

    return v2

    .line 3
    :cond_10
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->a0:Z

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, v2, p1, v2}, Landroidx/viewpager/widget/ViewPager;->b(IFI)V

    .line 5
    iget-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->a0:Z

    if-eqz p1, :cond_1b

    return v2

    .line 6
    :cond_1b
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 7
    :cond_21
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->c()Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v0

    .line 8
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v3

    .line 9
    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    add-int v5, v3, v4

    int-to-float v4, v4

    int-to-float v3, v3

    div-float/2addr v4, v3

    .line 10
    iget v6, v0, Landroidx/viewpager/widget/ViewPager$f;->b:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    .line 11
    iget v3, v0, Landroidx/viewpager/widget/ViewPager$f;->e:F

    sub-float/2addr p1, v3

    iget v0, v0, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v0, v4

    div-float/2addr p1, v0

    int-to-float v0, v5

    mul-float v0, v0, p1

    float-to-int v0, v0

    .line 12
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->a0:Z

    .line 13
    invoke-virtual {p0, v6, p1, v0}, Landroidx/viewpager/widget/ViewPager;->b(IFI)V

    .line 14
    iget-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->a0:Z

    if-eqz p1, :cond_4a

    const/4 p1, 0x1

    return p1

    .line 15
    :cond_4a
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public f(I)V
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 1
    iget v2, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-eq v2, v1, :cond_f

    .line 2
    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->d(I)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v2

    .line 3
    iput v1, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    goto :goto_10

    :cond_f
    const/4 v2, 0x0

    .line 4
    :goto_10
    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-nez v1, :cond_18

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->j()V

    return-void

    .line 6
    :cond_18
    iget-boolean v1, v0, Landroidx/viewpager/widget/ViewPager;->C:Z

    if-eqz v1, :cond_20

    .line 7
    invoke-virtual/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->j()V

    return-void

    .line 8
    :cond_20
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    if-nez v1, :cond_27

    return-void

    .line 9
    :cond_27
    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, v0}, Lb/v/a/a;->b(Landroid/view/ViewGroup;)V

    .line 10
    iget v1, v0, Landroidx/viewpager/widget/ViewPager;->D:I

    .line 11
    iget v4, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    sub-int/2addr v4, v1

    const/4 v5, 0x0

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 12
    iget-object v6, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v6}, Lb/v/a/a;->a()I

    move-result v6

    add-int/lit8 v7, v6, -0x1

    .line 13
    iget v8, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    add-int/2addr v8, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 14
    iget v7, v0, Landroidx/viewpager/widget/ViewPager;->h:I

    if-ne v6, v7, :cond_20e

    const/4 v7, 0x0

    .line 15
    :goto_4a
    iget-object v8, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :cond_66

    .line 16
    iget-object v8, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/viewpager/widget/ViewPager$f;

    .line 17
    iget v9, v8, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v10, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-lt v9, v10, :cond_63

    if-ne v9, v10, :cond_66

    goto :goto_67

    :cond_63
    add-int/lit8 v7, v7, 0x1

    goto :goto_4a

    :cond_66
    const/4 v8, 0x0

    :goto_67
    if-nez v8, :cond_71

    if-lez v6, :cond_71

    .line 18
    iget v8, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {v0, v8, v7}, Landroidx/viewpager/widget/ViewPager;->a(II)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v8

    :cond_71
    const/4 v9, 0x0

    if-eqz v8, :cond_19b

    add-int/lit8 v10, v7, -0x1

    if-ltz v10, :cond_81

    .line 19
    iget-object v11, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_82

    :cond_81
    const/4 v11, 0x0

    .line 20
    :goto_82
    invoke-direct/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v12

    const/high16 v13, 0x40000000    # 2.0f

    if-gtz v12, :cond_8c

    const/4 v14, 0x0

    goto :goto_98

    .line 21
    :cond_8c
    iget v14, v8, Landroidx/viewpager/widget/ViewPager$f;->d:F

    sub-float v14, v13, v14

    .line 22
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v15

    int-to-float v15, v15

    int-to-float v3, v12

    div-float/2addr v15, v3

    add-float/2addr v14, v15

    .line 23
    :goto_98
    iget v3, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    add-int/lit8 v3, v3, -0x1

    const/4 v15, 0x0

    :goto_9d
    if-ltz v3, :cond_fd

    cmpl-float v16, v15, v14

    if-ltz v16, :cond_cb

    if-ge v3, v4, :cond_cb

    if-nez v11, :cond_a8

    goto :goto_fd

    .line 24
    :cond_a8
    iget v5, v11, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v3, v5, :cond_f9

    iget-boolean v5, v11, Landroidx/viewpager/widget/ViewPager$f;->c:Z

    if-nez v5, :cond_f9

    .line 25
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 26
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v11, v11, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v5, v0, v3, v11}, Lb/v/a/a;->a(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    add-int/lit8 v10, v10, -0x1

    add-int/lit8 v7, v7, -0x1

    if-ltz v10, :cond_f7

    .line 27
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_f8

    :cond_cb
    if-eqz v11, :cond_e1

    .line 28
    iget v5, v11, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v3, v5, :cond_e1

    .line 29
    iget v5, v11, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v15, v5

    add-int/lit8 v10, v10, -0x1

    if-ltz v10, :cond_f7

    .line 30
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_f8

    :cond_e1
    add-int/lit8 v5, v10, 0x1

    .line 31
    invoke-virtual {v0, v3, v5}, Landroidx/viewpager/widget/ViewPager;->a(II)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v5

    .line 32
    iget v5, v5, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v15, v5

    add-int/lit8 v7, v7, 0x1

    if-ltz v10, :cond_f7

    .line 33
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_f8

    :cond_f7
    const/4 v5, 0x0

    :goto_f8
    move-object v11, v5

    :cond_f9
    add-int/lit8 v3, v3, -0x1

    const/4 v5, 0x0

    goto :goto_9d

    .line 34
    :cond_fd
    :goto_fd
    iget v3, v8, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-int/lit8 v4, v7, 0x1

    cmpg-float v5, v3, v13

    if-gez v5, :cond_18f

    .line 35
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_116

    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_117

    :cond_116
    const/4 v5, 0x0

    :goto_117
    if-gtz v12, :cond_11b

    const/4 v10, 0x0

    goto :goto_123

    .line 36
    :cond_11b
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v10

    int-to-float v10, v10

    int-to-float v11, v12

    div-float/2addr v10, v11

    add-float/2addr v10, v13

    .line 37
    :goto_123
    iget v11, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    :goto_125
    add-int/lit8 v11, v11, 0x1

    if-ge v11, v6, :cond_18f

    cmpl-float v12, v3, v10

    if-ltz v12, :cond_159

    if-le v11, v1, :cond_159

    if-nez v5, :cond_132

    goto :goto_18f

    .line 38
    :cond_132
    iget v12, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v11, v12, :cond_18e

    iget-boolean v12, v5, Landroidx/viewpager/widget/ViewPager$f;->c:Z

    if-nez v12, :cond_18e

    .line 39
    iget-object v12, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 40
    iget-object v12, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v5, v5, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v12, v0, v11, v5}, Lb/v/a/a;->a(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 41
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_157

    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_18e

    :cond_157
    const/4 v5, 0x0

    goto :goto_18e

    :cond_159
    if-eqz v5, :cond_175

    .line 42
    iget v12, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v11, v12, :cond_175

    .line 43
    iget v5, v5, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v3, v5

    add-int/lit8 v4, v4, 0x1

    .line 44
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_157

    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_18e

    .line 45
    :cond_175
    invoke-virtual {v0, v11, v4}, Landroidx/viewpager/widget/ViewPager;->a(II)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    .line 46
    iget v5, v5, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v3, v5

    .line 47
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_157

    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    :cond_18e
    :goto_18e
    goto :goto_125

    .line 48
    :cond_18f
    :goto_18f
    invoke-virtual {v0, v8, v7, v2}, Landroidx/viewpager/widget/ViewPager;->a(Landroidx/viewpager/widget/ViewPager$f;ILandroidx/viewpager/widget/ViewPager$f;)V

    .line 49
    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget v2, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    iget-object v3, v8, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0, v2, v3}, Lb/v/a/a;->b(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 50
    :cond_19b
    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v1, v0}, Lb/v/a/a;->a(Landroid/view/ViewGroup;)V

    .line 51
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_1a5
    if-ge v2, v1, :cond_1ce

    .line 52
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 53
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 54
    iput v2, v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;->f:I

    .line 55
    iget-boolean v5, v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v5, :cond_1cb

    iget v5, v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;->c:F

    cmpl-float v5, v5, v9

    if-nez v5, :cond_1cb

    .line 56
    invoke-virtual {v0, v3}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v3

    if-eqz v3, :cond_1cb

    .line 57
    iget v5, v3, Landroidx/viewpager/widget/ViewPager$f;->d:F

    iput v5, v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;->c:F

    .line 58
    iget v3, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iput v3, v4, Landroidx/viewpager/widget/ViewPager$LayoutParams;->e:I

    :cond_1cb
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a5

    .line 59
    :cond_1ce
    invoke-virtual/range {p0 .. p0}, Landroidx/viewpager/widget/ViewPager;->j()V

    .line 60
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_20d

    .line 61
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1e2

    .line 62
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v3

    goto :goto_1e3

    :cond_1e2
    const/4 v3, 0x0

    :goto_1e3
    if-eqz v3, :cond_1eb

    .line 63
    iget v1, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v2, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-eq v1, v2, :cond_20d

    :cond_1eb
    const/4 v5, 0x0

    .line 64
    :goto_1ec
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v5, v1, :cond_20d

    .line 65
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v2

    if-eqz v2, :cond_20a

    .line 67
    iget v2, v2, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v3, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v2, v3, :cond_20a

    const/4 v2, 0x2

    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->requestFocus(I)Z

    move-result v1

    if-eqz v1, :cond_20a

    goto :goto_20d

    :cond_20a
    add-int/lit8 v5, v5, 0x1

    goto :goto_1ec

    :cond_20d
    :goto_20d
    return-void

    .line 69
    :cond_20e
    :try_start_20e
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1
    :try_end_21a
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_20e .. :try_end_21a} :catch_21b

    goto :goto_223

    .line 70
    :catch_21b
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 71
    :goto_223
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The application\'s PagerAdapter changed the adapter\'s contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Landroidx/viewpager/widget/ViewPager;->h:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", found: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " Pager id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " Pager class: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " Problematic adapter: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    .line 73
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public f()Z
    .registers 4

    .line 74
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v0, :cond_15

    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    if-ge v1, v0, :cond_15

    .line 75
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0, v2}, Landroidx/viewpager/widget/ViewPager;->a(IZ)V

    return v2

    :cond_15
    const/4 v0, 0x0

    return v0
.end method

.method public g()V
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->f(I)V

    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    new-instance v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .line 2
    new-instance v0, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/viewpager/widget/ViewPager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public getAdapter()Lb/v/a/a;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    return-object v0
.end method

.method public getChildDrawingOrder(II)I
    .registers 5

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->i0:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    add-int/lit8 p1, p1, -0x1

    sub-int p2, p1, p2

    .line 2
    :cond_9
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->j0:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    iget p1, p1, Landroidx/viewpager/widget/ViewPager$LayoutParams;->f:I

    return p1
.end method

.method public getCurrentItem()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    return v0
.end method

.method public getPageMargin()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    return v0
.end method

.method public final h()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 4
    iget-boolean v1, v1, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v1, :cond_1a

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeViewAt(I)V

    add-int/lit8 v0, v0, -0x1

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1d
    return-void
.end method

.method public final i()Z
    .registers 2

    const/4 v0, -0x1

    .line 1
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    .line 2
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->b()V

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 4
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 5
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->U:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_23

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->V:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_21

    goto :goto_23

    :cond_21
    const/4 v0, 0x0

    goto :goto_24

    :cond_23
    :goto_23
    const/4 v0, 0x1

    :goto_24
    return v0
.end method

.method public final j()V
    .registers 5

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->i0:I

    if-eqz v0, :cond_2d

    .line 2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->j0:Ljava/util/ArrayList;

    if-nez v0, :cond_10

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->j0:Ljava/util/ArrayList;

    goto :goto_13

    .line 4
    :cond_10
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 5
    :goto_13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_18
    if-ge v1, v0, :cond_26

    .line 6
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 7
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->j0:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 8
    :cond_26
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->j0:Ljava/util/ArrayList;

    sget-object v1, Landroidx/viewpager/widget/ViewPager;->p0:Landroidx/viewpager/widget/ViewPager$l;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_2d
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->k0:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_14

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 4
    :cond_14
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 19

    move-object/from16 v0, p0

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget v1, v0, Landroidx/viewpager/widget/ViewPager;->t:I

    if-lez v1, :cond_ac

    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_ac

    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_ac

    iget-object v1, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v1, :cond_ac

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v1

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    .line 5
    iget v3, v0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    .line 6
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    .line 7
    iget v7, v5, Landroidx/viewpager/widget/ViewPager$f;->e:F

    .line 8
    iget-object v8, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 9
    iget v9, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    .line 10
    iget-object v10, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    add-int/lit8 v11, v8, -0x1

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/viewpager/widget/ViewPager$f;

    iget v10, v10, Landroidx/viewpager/widget/ViewPager$f;->b:I

    :goto_45
    if-ge v9, v10, :cond_ac

    .line 11
    :goto_47
    iget v11, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-le v9, v11, :cond_58

    if-ge v6, v8, :cond_58

    .line 12
    iget-object v5, v0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/viewpager/widget/ViewPager$f;

    goto :goto_47

    .line 13
    :cond_58
    iget v11, v5, Landroidx/viewpager/widget/ViewPager$f;->b:I

    if-ne v9, v11, :cond_67

    .line 14
    iget v7, v5, Landroidx/viewpager/widget/ViewPager$f;->e:F

    iget v11, v5, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float v12, v7, v11

    mul-float v12, v12, v4

    add-float/2addr v7, v11

    add-float/2addr v7, v3

    goto :goto_73

    .line 15
    :cond_67
    iget-object v11, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v11, v9}, Lb/v/a/a;->b(I)F

    move-result v11

    add-float v12, v7, v11

    mul-float v12, v12, v4

    add-float/2addr v11, v3

    add-float/2addr v7, v11

    .line 16
    :goto_73
    iget v11, v0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v11, v11

    add-float/2addr v11, v12

    int-to-float v13, v1

    cmpl-float v11, v11, v13

    if-lez v11, :cond_9b

    .line 17
    iget-object v11, v0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v13

    iget v14, v0, Landroidx/viewpager/widget/ViewPager;->v:I

    iget v15, v0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v15, v15

    add-float/2addr v15, v12

    .line 18
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    move-result v15

    move/from16 v16, v3

    iget v3, v0, Landroidx/viewpager/widget/ViewPager;->w:I

    .line 19
    invoke-virtual {v11, v13, v14, v15, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 20
    iget-object v3, v0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    move-object/from16 v11, p1

    invoke-virtual {v3, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_9f

    :cond_9b
    move-object/from16 v11, p1

    move/from16 v16, v3

    :goto_9f
    add-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v12, v3

    if-lez v3, :cond_a7

    goto :goto_ac

    :cond_a7
    add-int/lit8 v9, v9, 0x1

    move/from16 v3, v16

    goto :goto_45

    :cond_ac
    :goto_ac
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 17

    move-object v6, p0

    move-object/from16 v7, p1

    .line 1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v8, 0x0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_112

    const/4 v9, 0x1

    if-ne v0, v9, :cond_12

    goto/16 :goto_112

    :cond_12
    if-eqz v0, :cond_1e

    .line 2
    iget-boolean v1, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-eqz v1, :cond_19

    return v9

    .line 3
    :cond_19
    iget-boolean v1, v6, Landroidx/viewpager/widget/ViewPager;->F:Z

    if-eqz v1, :cond_1e

    return v8

    :cond_1e
    const/4 v1, 0x2

    if-eqz v0, :cond_b0

    if-eq v0, v1, :cond_2d

    const/4 v1, 0x6

    if-eq v0, v1, :cond_28

    goto/16 :goto_100

    .line 4
    :cond_28
    invoke-virtual/range {p0 .. p1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/MotionEvent;)V

    goto/16 :goto_100

    .line 5
    :cond_2d
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->N:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_34

    goto/16 :goto_100

    .line 6
    :cond_34
    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 7
    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    .line 8
    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->J:F

    sub-float v1, v10, v1

    .line 9
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v11

    .line 10
    invoke-virtual {v7, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v12

    .line 11
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->M:F

    sub-float v0, v12, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v13

    const/4 v0, 0x0

    cmpl-float v14, v1, v0

    if-eqz v14, :cond_70

    .line 12
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->J:F

    invoke-virtual {p0, v0, v1}, Landroidx/viewpager/widget/ViewPager;->a(FF)Z

    move-result v0

    if-nez v0, :cond_70

    const/4 v2, 0x0

    float-to-int v3, v1

    float-to-int v4, v10

    float-to-int v5, v12

    move-object v0, p0

    move-object v1, p0

    .line 13
    invoke-virtual/range {v0 .. v5}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 14
    iput v10, v6, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 15
    iput v12, v6, Landroidx/viewpager/widget/ViewPager;->K:F

    .line 16
    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->F:Z

    return v8

    .line 17
    :cond_70
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v0, v0

    cmpl-float v0, v11, v0

    if-lez v0, :cond_99

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v11, v11, v0

    cmpl-float v0, v11, v13

    if-lez v0, :cond_99

    .line 18
    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    .line 19
    invoke-virtual {p0, v9}, Landroidx/viewpager/widget/ViewPager;->c(Z)V

    .line 20
    invoke-virtual {p0, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    .line 21
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->L:F

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v1, v1

    if-lez v14, :cond_90

    add-float/2addr v0, v1

    goto :goto_91

    :cond_90
    sub-float/2addr v0, v1

    :goto_91
    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 22
    iput v12, v6, Landroidx/viewpager/widget/ViewPager;->K:F

    .line 23
    invoke-direct {p0, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_a2

    .line 24
    :cond_99
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v0, v0

    cmpl-float v0, v13, v0

    if-lez v0, :cond_a2

    .line 25
    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->F:Z

    .line 26
    :cond_a2
    :goto_a2
    iget-boolean v0, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-eqz v0, :cond_100

    .line 27
    invoke-virtual {p0, v10}, Landroidx/viewpager/widget/ViewPager;->b(F)Z

    move-result v0

    if-eqz v0, :cond_100

    .line 28
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    goto :goto_100

    .line 29
    :cond_b0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->L:F

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 30
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->M:F

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->K:F

    .line 31
    invoke-virtual {v7, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v6, Landroidx/viewpager/widget/ViewPager;->N:I

    .line 32
    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->F:Z

    .line 33
    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->r:Z

    .line 34
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 35
    iget v0, v6, Landroidx/viewpager/widget/ViewPager;->l0:I

    if-ne v0, v1, :cond_fb

    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    .line 36
    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, v6, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v6, Landroidx/viewpager/widget/ViewPager;->S:I

    if-le v0, v1, :cond_fb

    .line 37
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 38
    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 39
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    .line 40
    iput-boolean v9, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    .line 41
    invoke-virtual {p0, v9}, Landroidx/viewpager/widget/ViewPager;->c(Z)V

    .line 42
    invoke-virtual {p0, v9}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    goto :goto_100

    .line 43
    :cond_fb
    invoke-virtual {p0, v8}, Landroidx/viewpager/widget/ViewPager;->a(Z)V

    .line 44
    iput-boolean v8, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    .line 45
    :cond_100
    :goto_100
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    if-nez v0, :cond_10a

    .line 46
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v6, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    .line 47
    :cond_10a
    iget-object v0, v6, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    invoke-virtual {v0, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 48
    iget-boolean v0, v6, Landroidx/viewpager/widget/ViewPager;->E:Z

    return v0

    .line 49
    :cond_112
    :goto_112
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->i()Z

    return v8
.end method

.method public onLayout(ZIIII)V
    .registers 24

    move-object/from16 v0, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    sub-int v2, p4, p2

    sub-int v3, p5, p3

    .line 2
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v4

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v6

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v7

    .line 6
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v8

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_20
    const/16 v12, 0x8

    if-ge v10, v1, :cond_b6

    .line 7
    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 8
    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v14

    if-eq v14, v12, :cond_b2

    .line 9
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 10
    iget-boolean v14, v12, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-eqz v14, :cond_b2

    .line 11
    iget v12, v12, Landroidx/viewpager/widget/ViewPager$LayoutParams;->b:I

    and-int/lit8 v14, v12, 0x7

    and-int/lit8 v12, v12, 0x70

    const/4 v15, 0x1

    if-eq v14, v15, :cond_5c

    const/4 v15, 0x3

    if-eq v14, v15, :cond_56

    const/4 v15, 0x5

    if-eq v14, v15, :cond_49

    move v14, v4

    goto :goto_6d

    :cond_49
    sub-int v14, v2, v6

    .line 12
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    sub-int/2addr v14, v15

    .line 13
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v6, v15

    goto :goto_68

    .line 14
    :cond_56
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    add-int/2addr v14, v4

    goto :goto_6d

    .line 15
    :cond_5c
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v14, v2, v14

    div-int/lit8 v14, v14, 0x2

    invoke-static {v14, v4}, Ljava/lang/Math;->max(II)I

    move-result v14

    :goto_68
    move/from16 v17, v14

    move v14, v4

    move/from16 v4, v17

    :goto_6d
    const/16 v15, 0x10

    if-eq v12, v15, :cond_8e

    const/16 v15, 0x30

    if-eq v12, v15, :cond_88

    const/16 v15, 0x50

    if-eq v12, v15, :cond_7b

    move v12, v5

    goto :goto_9f

    :cond_7b
    sub-int v12, v3, v7

    .line 16
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    sub-int/2addr v12, v15

    .line 17
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v15

    add-int/2addr v7, v15

    goto :goto_9a

    .line 18
    :cond_88
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    add-int/2addr v12, v5

    goto :goto_9f

    .line 19
    :cond_8e
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    sub-int v12, v3, v12

    div-int/lit8 v12, v12, 0x2

    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    move-result v12

    :goto_9a
    move/from16 v17, v12

    move v12, v5

    move/from16 v5, v17

    :goto_9f
    add-int/2addr v4, v8

    .line 20
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v15, v4

    .line 21
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v9, v5, v16

    .line 22
    invoke-virtual {v13, v4, v5, v15, v9}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 v11, v11, 0x1

    move v5, v12

    move v4, v14

    :cond_b2
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_20

    :cond_b6
    sub-int/2addr v2, v4

    sub-int/2addr v2, v6

    const/4 v6, 0x0

    :goto_b9
    if-ge v6, v1, :cond_108

    .line 23
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 24
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-eq v9, v12, :cond_105

    .line 25
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    .line 26
    iget-boolean v10, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v10, :cond_105

    invoke-virtual {v0, v8}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v10

    if-eqz v10, :cond_105

    int-to-float v13, v2

    .line 27
    iget v10, v10, Landroidx/viewpager/widget/ViewPager$f;->e:F

    mul-float v10, v10, v13

    float-to-int v10, v10

    add-int/2addr v10, v4

    .line 28
    iget-boolean v14, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->d:Z

    if-eqz v14, :cond_f8

    const/4 v14, 0x0

    .line 29
    iput-boolean v14, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->d:Z

    .line 30
    iget v9, v9, Landroidx/viewpager/widget/ViewPager$LayoutParams;->c:F

    mul-float v13, v13, v9

    float-to-int v9, v13

    const/high16 v13, 0x40000000    # 2.0f

    invoke-static {v9, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    sub-int v14, v3, v5

    sub-int/2addr v14, v7

    .line 31
    invoke-static {v14, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 32
    invoke-virtual {v8, v9, v13}, Landroid/view/View;->measure(II)V

    .line 33
    :cond_f8
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    add-int/2addr v9, v10

    .line 34
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    add-int/2addr v13, v5

    .line 35
    invoke-virtual {v8, v10, v5, v9, v13}, Landroid/view/View;->layout(IIII)V

    :cond_105
    add-int/lit8 v6, v6, 0x1

    goto :goto_b9

    .line 36
    :cond_108
    iput v5, v0, Landroidx/viewpager/widget/ViewPager;->v:I

    sub-int/2addr v3, v7

    .line 37
    iput v3, v0, Landroidx/viewpager/widget/ViewPager;->w:I

    .line 38
    iput v11, v0, Landroidx/viewpager/widget/ViewPager;->b0:I

    .line 39
    iget-boolean v1, v0, Landroidx/viewpager/widget/ViewPager;->W:Z

    if-eqz v1, :cond_11a

    .line 40
    iget v1, v0, Landroidx/viewpager/widget/ViewPager;->m:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/viewpager/widget/ViewPager;->a(IZIZ)V

    goto :goto_11b

    :cond_11a
    const/4 v2, 0x0

    .line 41
    :goto_11b
    iput-boolean v2, v0, Landroidx/viewpager/widget/ViewPager;->W:Z

    return-void
.end method

.method public onMeasure(II)V
    .registers 16

    const/4 v0, 0x0

    .line 1
    invoke-static {v0, p1}, Landroid/view/ViewGroup;->getDefaultSize(II)I

    move-result p1

    .line 2
    invoke-static {v0, p2}, Landroid/view/ViewGroup;->getDefaultSize(II)I

    move-result p2

    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p1

    .line 5
    div-int/lit8 p2, p1, 0xa

    .line 6
    iget v1, p0, Landroidx/viewpager/widget/ViewPager;->G:I

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->H:I

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p2

    sub-int/2addr p1, p2

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    sub-int/2addr p2, v1

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_37
    const/16 v3, 0x8

    const/4 v4, 0x1

    const/high16 v5, 0x40000000    # 2.0f

    if-ge v2, v1, :cond_b2

    .line 10
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 11
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eq v7, v3, :cond_af

    .line 12
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    if-eqz v3, :cond_af

    .line 13
    iget-boolean v7, v3, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-eqz v7, :cond_af

    .line 14
    iget v7, v3, Landroidx/viewpager/widget/ViewPager$LayoutParams;->b:I

    and-int/lit8 v8, v7, 0x7

    and-int/lit8 v7, v7, 0x70

    const/16 v9, 0x30

    if-eq v7, v9, :cond_65

    const/16 v9, 0x50

    if-ne v7, v9, :cond_63

    goto :goto_65

    :cond_63
    const/4 v7, 0x0

    goto :goto_66

    :cond_65
    :goto_65
    const/4 v7, 0x1

    :goto_66
    const/4 v9, 0x3

    if-eq v8, v9, :cond_6e

    const/4 v9, 0x5

    if-ne v8, v9, :cond_6d

    goto :goto_6e

    :cond_6d
    const/4 v4, 0x0

    :cond_6e
    :goto_6e
    const/high16 v8, -0x80000000

    if-eqz v7, :cond_75

    const/high16 v8, 0x40000000    # 2.0f

    goto :goto_7a

    :cond_75
    if-eqz v4, :cond_7a

    const/high16 v9, 0x40000000    # 2.0f

    goto :goto_7c

    :cond_7a
    :goto_7a
    const/high16 v9, -0x80000000

    .line 15
    :goto_7c
    iget v10, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v11, -0x1

    const/4 v12, -0x2

    if-eq v10, v12, :cond_89

    if-eq v10, v11, :cond_85

    goto :goto_86

    :cond_85
    move v10, p1

    :goto_86
    const/high16 v8, 0x40000000    # 2.0f

    goto :goto_8a

    :cond_89
    move v10, p1

    .line 16
    :goto_8a
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v12, :cond_93

    if-eq v3, v11, :cond_91

    goto :goto_95

    :cond_91
    move v3, p2

    goto :goto_95

    :cond_93
    move v3, p2

    move v5, v9

    .line 17
    :goto_95
    invoke-static {v10, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 18
    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 19
    invoke-virtual {v6, v8, v3}, Landroid/view/View;->measure(II)V

    if-eqz v7, :cond_a8

    .line 20
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr p2, v3

    goto :goto_af

    :cond_a8
    if-eqz v4, :cond_af

    .line 21
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    sub-int/2addr p1, v3

    :cond_af
    :goto_af
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 22
    :cond_b2
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 23
    invoke-static {p2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    iput p2, p0, Landroidx/viewpager/widget/ViewPager;->z:I

    .line 24
    iput-boolean v4, p0, Landroidx/viewpager/widget/ViewPager;->A:Z

    .line 25
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    .line 26
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->A:Z

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    :goto_c6
    if-ge v0, p2, :cond_f0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, v3, :cond_ed

    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager$LayoutParams;

    if-eqz v2, :cond_de

    .line 31
    iget-boolean v4, v2, Landroidx/viewpager/widget/ViewPager$LayoutParams;->a:Z

    if-nez v4, :cond_ed

    :cond_de
    int-to-float v4, p1

    .line 32
    iget v2, v2, Landroidx/viewpager/widget/ViewPager$LayoutParams;->c:F

    mul-float v4, v4, v2

    float-to-int v2, v4

    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 33
    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->z:I

    invoke-virtual {v1, v2, v4}, Landroid/view/View;->measure(II)V

    :cond_ed
    add-int/lit8 v0, v0, 0x1

    goto :goto_c6

    :cond_f0
    return-void
.end method

.method public onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .registers 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    and-int/lit8 v1, p1, 0x2

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-eqz v1, :cond_f

    move v3, v0

    const/4 v0, 0x0

    const/4 v1, 0x1

    goto :goto_12

    :cond_f
    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    :goto_12
    if-eq v0, v3, :cond_33

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 3
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_31

    .line 4
    invoke-virtual {p0, v5}, Landroidx/viewpager/widget/ViewPager;->b(Landroid/view/View;)Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v6

    if-eqz v6, :cond_31

    .line 5
    iget v6, v6, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget v7, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    if-ne v6, v7, :cond_31

    .line 6
    invoke-virtual {v5, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v5

    if-eqz v5, :cond_31

    return v4

    :cond_31
    add-int/2addr v0, v1

    goto :goto_12

    :cond_33
    return v2
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5

    .line 1
    instance-of v0, p1, Landroidx/viewpager/widget/ViewPager$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Landroidx/viewpager/widget/ViewPager$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v0, :cond_24

    .line 6
    iget-object v1, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->k:Landroid/os/Parcelable;

    iget-object v2, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->l:Ljava/lang/ClassLoader;

    invoke-virtual {v0, v1, v2}, Lb/v/a/a;->a(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 7
    iget p1, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->j:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroidx/viewpager/widget/ViewPager;->a(IZZ)V

    goto :goto_30

    .line 8
    :cond_24
    iget v0, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->j:I

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    .line 9
    iget-object v0, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->k:Landroid/os/Parcelable;

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->o:Landroid/os/Parcelable;

    .line 10
    iget-object p1, p1, Landroidx/viewpager/widget/ViewPager$SavedState;->l:Ljava/lang/ClassLoader;

    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->p:Ljava/lang/ClassLoader;

    :goto_30
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Landroidx/viewpager/widget/ViewPager$SavedState;

    invoke-direct {v1, v0}, Landroidx/viewpager/widget/ViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    iput v0, v1, Landroidx/viewpager/widget/ViewPager$SavedState;->j:I

    .line 4
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v0, :cond_17

    .line 5
    invoke-virtual {v0}, Lb/v/a/a;->b()Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, v1, Landroidx/viewpager/widget/ViewPager$SavedState;->k:Landroid/os/Parcelable;

    :cond_17
    return-object v1
.end method

.method public onSizeChanged(IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_a

    .line 2
    iget p2, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    invoke-virtual {p0, p1, p3, p2, p2}, Landroidx/viewpager/widget/ViewPager;->a(IIII)V

    :cond_a
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    .line 1
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->T:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    .line 2
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_14

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v0

    if-eqz v0, :cond_14

    return v2

    .line 3
    :cond_14
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz v0, :cond_15f

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_15f

    .line 4
    :cond_20
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    if-nez v0, :cond_2a

    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    .line 6
    :cond_2a
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_139

    if-eq v0, v1, :cond_ec

    const/4 v3, 0x2

    if-eq v0, v3, :cond_79

    const/4 v3, 0x3

    if-eq v0, v3, :cond_6a

    const/4 v3, 0x5

    if-eq v0, v3, :cond_58

    const/4 v3, 0x6

    if-eq v0, v3, :cond_47

    goto/16 :goto_159

    .line 8
    :cond_47
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->a(Landroid/view/MotionEvent;)V

    .line 9
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    goto/16 :goto_159

    .line 10
    :cond_58
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 12
    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    goto/16 :goto_159

    .line 14
    :cond_6a
    iget-boolean p1, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-eqz p1, :cond_159

    .line 15
    iget p1, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p0, p1, v1, v2, v2}, Landroidx/viewpager/widget/ViewPager;->a(IZIZ)V

    .line 16
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->i()Z

    move-result v2

    goto/16 :goto_159

    .line 17
    :cond_79
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-nez v0, :cond_d8

    .line 18
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_8c

    .line 19
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->i()Z

    move-result v2

    goto/16 :goto_159

    .line 20
    :cond_8c
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 21
    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    sub-float v4, v3, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    .line 23
    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->K:F

    sub-float v5, v0, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 24
    iget v6, p0, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v6, v6

    cmpl-float v6, v4, v6

    if-lez v6, :cond_d8

    cmpl-float v4, v4, v5

    if-lez v4, :cond_d8

    .line 25
    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    .line 26
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->c(Z)V

    .line 27
    iget v4, p0, Landroidx/viewpager/widget/ViewPager;->L:F

    sub-float/2addr v3, v4

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-lez v3, :cond_c1

    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v3, v3

    add-float/2addr v4, v3

    goto :goto_c5

    :cond_c1
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->I:I

    int-to-float v3, v3

    sub-float/2addr v4, v3

    :goto_c5
    iput v4, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 28
    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->K:F

    .line 29
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    .line 30
    invoke-direct {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_d8

    .line 32
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 33
    :cond_d8
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-eqz v0, :cond_159

    .line 34
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->b(F)Z

    move-result p1

    or-int/2addr v2, p1

    goto :goto_159

    .line 37
    :cond_ec
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->E:Z

    if-eqz v0, :cond_159

    .line 38
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->O:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    .line 39
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->Q:I

    int-to-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 40
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    invoke-virtual {v0, v2}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v0

    float-to-int v0, v0

    .line 41
    iput-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 42
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager;->getClientWidth()I

    move-result v2

    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v3

    .line 44
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->c()Landroidx/viewpager/widget/ViewPager$f;

    move-result-object v4

    .line 45
    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    int-to-float v5, v5

    int-to-float v2, v2

    div-float/2addr v5, v2

    .line 46
    iget v6, v4, Landroidx/viewpager/widget/ViewPager$f;->b:I

    int-to-float v3, v3

    div-float/2addr v3, v2

    .line 47
    iget v2, v4, Landroidx/viewpager/widget/ViewPager$f;->e:F

    sub-float/2addr v3, v2

    iget v2, v4, Landroidx/viewpager/widget/ViewPager$f;->d:F

    add-float/2addr v2, v5

    div-float/2addr v3, v2

    .line 48
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    .line 49
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    .line 50
    iget v2, p0, Landroidx/viewpager/widget/ViewPager;->L:F

    sub-float/2addr p1, v2

    float-to-int p1, p1

    .line 51
    invoke-virtual {p0, v6, v3, v0, p1}, Landroidx/viewpager/widget/ViewPager;->a(IFII)I

    move-result p1

    .line 52
    invoke-virtual {p0, p1, v1, v1, v0}, Landroidx/viewpager/widget/ViewPager;->a(IZZI)V

    .line 53
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->i()Z

    move-result v2

    goto :goto_159

    .line 54
    :cond_139
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->q:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 55
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 56
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    .line 57
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->L:F

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->J:F

    .line 58
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->M:F

    iput v0, p0, Landroidx/viewpager/widget/ViewPager;->K:F

    .line 59
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->N:I

    :cond_159
    :goto_159
    if-eqz v2, :cond_15e

    .line 60
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_15e
    return v1

    :cond_15f
    :goto_15f
    return v2
.end method

.method public removeView(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->A:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    goto :goto_b

    .line 3
    :cond_8
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :goto_b
    return-void
.end method

.method public setAdapter(Lb/v/a/a;)V
    .registers 9

    .line 1
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_3d

    .line 2
    invoke-virtual {v0, v1}, Lb/v/a/a;->b(Landroid/database/DataSetObserver;)V

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0, p0}, Lb/v/a/a;->b(Landroid/view/ViewGroup;)V

    const/4 v0, 0x0

    .line 4
    :goto_f
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_2b

    .line 5
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$f;

    .line 6
    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget v5, v3, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v3, v3, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    invoke-virtual {v4, p0, v5, v3}, Lb/v/a/a;->a(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 7
    :cond_2b
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v0, p0}, Lb/v/a/a;->a(Landroid/view/ViewGroup;)V

    .line 8
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->h()V

    .line 10
    iput v2, p0, Landroidx/viewpager/widget/ViewPager;->m:I

    .line 11
    invoke-virtual {p0, v2, v2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 12
    :cond_3d
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    .line 13
    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    .line 14
    iput v2, p0, Landroidx/viewpager/widget/ViewPager;->h:I

    if-eqz p1, :cond_89

    .line 15
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->s:Landroidx/viewpager/widget/ViewPager$k;

    if-nez v3, :cond_50

    .line 16
    new-instance v3, Landroidx/viewpager/widget/ViewPager$k;

    invoke-direct {v3, p0}, Landroidx/viewpager/widget/ViewPager$k;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object v3, p0, Landroidx/viewpager/widget/ViewPager;->s:Landroidx/viewpager/widget/ViewPager$k;

    .line 17
    :cond_50
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v4, p0, Landroidx/viewpager/widget/ViewPager;->s:Landroidx/viewpager/widget/ViewPager$k;

    invoke-virtual {v3, v4}, Lb/v/a/a;->b(Landroid/database/DataSetObserver;)V

    .line 18
    iput-boolean v2, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 19
    iget-boolean v3, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    const/4 v4, 0x1

    .line 20
    iput-boolean v4, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    .line 21
    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    invoke-virtual {v5}, Lb/v/a/a;->a()I

    move-result v5

    iput v5, p0, Landroidx/viewpager/widget/ViewPager;->h:I

    .line 22
    iget v5, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    if-ltz v5, :cond_80

    .line 23
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    iget-object v5, p0, Landroidx/viewpager/widget/ViewPager;->o:Landroid/os/Parcelable;

    iget-object v6, p0, Landroidx/viewpager/widget/ViewPager;->p:Ljava/lang/ClassLoader;

    invoke-virtual {v3, v5, v6}, Lb/v/a/a;->a(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 24
    iget v3, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    invoke-virtual {p0, v3, v2, v4}, Landroidx/viewpager/widget/ViewPager;->a(IZZ)V

    const/4 v3, -0x1

    .line 25
    iput v3, p0, Landroidx/viewpager/widget/ViewPager;->n:I

    .line 26
    iput-object v1, p0, Landroidx/viewpager/widget/ViewPager;->o:Landroid/os/Parcelable;

    .line 27
    iput-object v1, p0, Landroidx/viewpager/widget/ViewPager;->p:Ljava/lang/ClassLoader;

    goto :goto_89

    :cond_80
    if-nez v3, :cond_86

    .line 28
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    goto :goto_89

    .line 29
    :cond_86
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 30
    :cond_89
    :goto_89
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    if-eqz v1, :cond_a9

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a9

    .line 31
    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_99
    if-ge v2, v1, :cond_a9

    .line 32
    iget-object v3, p0, Landroidx/viewpager/widget/ViewPager;->f0:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/viewpager/widget/ViewPager$h;

    invoke-interface {v3, p0, v0, p1}, Landroidx/viewpager/widget/ViewPager$h;->a(Landroidx/viewpager/widget/ViewPager;Lb/v/a/a;Lb/v/a/a;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_99

    :cond_a9
    return-void
.end method

.method public setCurrentItem(I)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/viewpager/widget/ViewPager;->C:Z

    .line 2
    iget-boolean v1, p0, Landroidx/viewpager/widget/ViewPager;->W:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Landroidx/viewpager/widget/ViewPager;->a(IZZ)V

    return-void
.end method

.method public setOffscreenPageLimit(I)V
    .registers 5

    const/4 v0, 0x1

    if-ge p1, v0, :cond_22

    .line 1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested offscreen page limit "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " too small; defaulting to "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "ViewPager"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    .line 2
    :cond_22
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    if-eq p1, v0, :cond_2b

    .line 3
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->D:I

    .line 4
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->g()V

    :cond_2b
    return-void
.end method

.method public setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$i;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->d0:Landroidx/viewpager/widget/ViewPager$i;

    return-void
.end method

.method public setPageMargin(I)V
    .registers 4

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    .line 2
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->t:I

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    .line 4
    invoke-virtual {p0, v1, v1, p1, v0}, Landroidx/viewpager/widget/ViewPager;->a(IIII)V

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    return-void
.end method

.method public setPageMarginDrawable(I)V
    .registers 3

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_7

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->refreshDrawableState()V

    :cond_7
    if-nez p1, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    .line 3
    :goto_c
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setScrollState(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/viewpager/widget/ViewPager;->l0:I

    if-ne v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Landroidx/viewpager/widget/ViewPager;->l0:I

    .line 3
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->g0:Landroidx/viewpager/widget/ViewPager$j;

    if-eqz v0, :cond_13

    if-eqz p1, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 4
    :goto_10
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->b(Z)V

    .line 5
    :cond_13
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->c(I)V

    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager;->u:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p1, 0x1

    :goto_e
    return p1
.end method
