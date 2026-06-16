.class public Landroidx/drawerlayout/widget/DrawerLayout;
.super Landroid/view/ViewGroup;
.source "DrawerLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/drawerlayout/widget/DrawerLayout$c;,
        Landroidx/drawerlayout/widget/DrawerLayout$b;,
        Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;,
        Landroidx/drawerlayout/widget/DrawerLayout$e;,
        Landroidx/drawerlayout/widget/DrawerLayout$SavedState;,
        Landroidx/drawerlayout/widget/DrawerLayout$d;
    }
.end annotation


# static fields
.field public static final R:[I

.field public static final S:[I

.field public static final T:Z

.field public static final U:Z


# instance fields
.field public A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/drawerlayout/widget/DrawerLayout$d;",
            ">;"
        }
    .end annotation
.end field

.field public B:F

.field public C:F

.field public D:Landroid/graphics/drawable/Drawable;

.field public E:Landroid/graphics/drawable/Drawable;

.field public F:Landroid/graphics/drawable/Drawable;

.field public G:Ljava/lang/CharSequence;

.field public H:Ljava/lang/CharSequence;

.field public I:Ljava/lang/Object;

.field public J:Z

.field public K:Landroid/graphics/drawable/Drawable;

.field public L:Landroid/graphics/drawable/Drawable;

.field public M:Landroid/graphics/drawable/Drawable;

.field public N:Landroid/graphics/drawable/Drawable;

.field public final O:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public P:Landroid/graphics/Rect;

.field public Q:Landroid/graphics/Matrix;

.field public final h:Landroidx/drawerlayout/widget/DrawerLayout$c;

.field public i:F

.field public j:I

.field public k:I

.field public l:F

.field public m:Landroid/graphics/Paint;

.field public final n:Lb/j/a/c;

.field public final o:Lb/j/a/c;

.field public final p:Landroidx/drawerlayout/widget/DrawerLayout$e;

.field public final q:Landroidx/drawerlayout/widget/DrawerLayout$e;

.field public r:I

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:Z

.field public z:Landroidx/drawerlayout/widget/DrawerLayout$d;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, 0x1010434

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 1
    sput-object v1, Landroidx/drawerlayout/widget/DrawerLayout;->R:[I

    new-array v1, v0, [I

    const v2, 0x10100b3

    aput v2, v1, v3

    .line 2
    sput-object v1, Landroidx/drawerlayout/widget/DrawerLayout;->S:[I

    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1c

    const/4 v1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    :goto_1d
    sput-boolean v1, Landroidx/drawerlayout/widget/DrawerLayout;->T:Z

    .line 4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_26

    goto :goto_27

    :cond_26
    const/4 v0, 0x0

    :goto_27
    sput-boolean v0, Landroidx/drawerlayout/widget/DrawerLayout;->U:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/drawerlayout/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Landroidx/drawerlayout/widget/DrawerLayout$c;

    invoke-direct {p2}, Landroidx/drawerlayout/widget/DrawerLayout$c;-><init>()V

    iput-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->h:Landroidx/drawerlayout/widget/DrawerLayout$c;

    const/high16 p2, -0x67000000

    .line 5
    iput p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->k:I

    .line 6
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->m:Landroid/graphics/Paint;

    const/4 p2, 0x1

    .line 7
    iput-boolean p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    const/4 p3, 0x3

    .line 8
    iput p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    .line 9
    iput p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    .line 10
    iput p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    .line 11
    iput p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->K:Landroid/graphics/drawable/Drawable;

    .line 13
    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->L:Landroid/graphics/drawable/Drawable;

    .line 14
    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->M:Landroid/graphics/drawable/Drawable;

    .line 15
    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->N:Landroid/graphics/drawable/Drawable;

    const/high16 v1, 0x40000

    .line 16
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42800000    # 64.0f

    mul-float v2, v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    .line 18
    iput v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->j:I

    const/high16 v2, 0x43c80000    # 400.0f

    mul-float v2, v2, v1

    .line 19
    new-instance v3, Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-direct {v3, p0, p3}, Landroidx/drawerlayout/widget/DrawerLayout$e;-><init>(Landroidx/drawerlayout/widget/DrawerLayout;I)V

    iput-object v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->p:Landroidx/drawerlayout/widget/DrawerLayout$e;

    .line 20
    new-instance p3, Landroidx/drawerlayout/widget/DrawerLayout$e;

    const/4 v3, 0x5

    invoke-direct {p3, p0, v3}, Landroidx/drawerlayout/widget/DrawerLayout$e;-><init>(Landroidx/drawerlayout/widget/DrawerLayout;I)V

    iput-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->q:Landroidx/drawerlayout/widget/DrawerLayout$e;

    .line 21
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->p:Landroidx/drawerlayout/widget/DrawerLayout$e;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {p0, v3, p3}, Lb/j/a/c;->a(Landroid/view/ViewGroup;FLb/j/a/c$c;)Lb/j/a/c;

    move-result-object p3

    iput-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    .line 22
    invoke-virtual {p3, p2}, Lb/j/a/c;->g(I)V

    .line 23
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p3, v2}, Lb/j/a/c;->b(F)V

    .line 24
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->p:Landroidx/drawerlayout/widget/DrawerLayout$e;

    iget-object v4, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p3, v4}, Landroidx/drawerlayout/widget/DrawerLayout$e;->a(Lb/j/a/c;)V

    .line 25
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->q:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-static {p0, v3, p3}, Lb/j/a/c;->a(Landroid/view/ViewGroup;FLb/j/a/c$c;)Lb/j/a/c;

    move-result-object p3

    iput-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    const/4 v3, 0x2

    .line 26
    invoke-virtual {p3, v3}, Lb/j/a/c;->g(I)V

    .line 27
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {p3, v2}, Lb/j/a/c;->b(F)V

    .line 28
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->q:Landroidx/drawerlayout/widget/DrawerLayout$e;

    iget-object v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {p3, v2}, Landroidx/drawerlayout/widget/DrawerLayout$e;->a(Lb/j/a/c;)V

    .line 29
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setFocusableInTouchMode(Z)V

    .line 30
    invoke-static {p0, p2}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 31
    new-instance p2, Landroidx/drawerlayout/widget/DrawerLayout$b;

    invoke-direct {p2, p0}, Landroidx/drawerlayout/widget/DrawerLayout$b;-><init>(Landroidx/drawerlayout/widget/DrawerLayout;)V

    invoke-static {p0, p2}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    const/4 p2, 0x0

    .line 32
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 33
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result p3

    if-eqz p3, :cond_c9

    .line 34
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt p3, v2, :cond_c7

    .line 35
    new-instance p3, Landroidx/drawerlayout/widget/DrawerLayout$a;

    invoke-direct {p3, p0}, Landroidx/drawerlayout/widget/DrawerLayout$a;-><init>(Landroidx/drawerlayout/widget/DrawerLayout;)V

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    const/16 p3, 0x500

    .line 36
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 37
    sget-object p3, Landroidx/drawerlayout/widget/DrawerLayout;->R:[I

    invoke-virtual {p1, p3}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 38
    :try_start_b8
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;
    :try_end_be
    .catchall {:try_start_b8 .. :try_end_be} :catchall_c2

    .line 39
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_c9

    :catchall_c2
    move-exception p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw p2

    .line 40
    :cond_c7
    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    :cond_c9
    :goto_c9
    const/high16 p1, 0x41200000    # 10.0f

    mul-float v1, v1, p1

    .line 41
    iput v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->i:F

    .line 42
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->O:Ljava/util/ArrayList;

    return-void
.end method

.method public static d(I)Ljava/lang/String;
    .registers 3

    and-int/lit8 v0, p0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_8

    const-string p0, "LEFT"

    return-object p0

    :cond_8
    and-int/lit8 v0, p0, 0x5

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    const-string p0, "RIGHT"

    return-object p0

    .line 5
    :cond_10
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static l(Landroid/view/View;)Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_f

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result p0

    const/4 v1, -0x1

    if-ne p0, v1, :cond_f

    const/4 v0, 0x1

    :cond_f
    return v0
.end method

.method public static m(Landroid/view/View;)Z
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    .line 2
    invoke-static {p0}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result p0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return p0
.end method


# virtual methods
.method public a(I)Landroid/view/View;
    .registers 6

    .line 49
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    .line 50
    invoke-static {p1, v0}, Lb/h/m/e;->a(II)I

    move-result p1

    and-int/lit8 p1, p1, 0x7

    .line 51
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_21

    .line 52
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 53
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->e(Landroid/view/View;)I

    move-result v3

    and-int/lit8 v3, v3, 0x7

    if-ne v3, p1, :cond_1e

    return-object v2

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_21
    const/4 p1, 0x0

    return-object p1
.end method

.method public a()V
    .registers 10

    .line 89
    iget-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    if-nez v0, :cond_28

    .line 90
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v1, v3

    .line 91
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    .line 92
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_16
    if-ge v2, v1, :cond_22

    .line 93
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 94
    :cond_22
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    :cond_28
    return-void
.end method

.method public a(II)V
    .registers 6

    .line 8
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    .line 9
    invoke-static {p2, v0}, Lb/h/m/e;->a(II)I

    move-result v0

    const/4 v1, 0x3

    if-eq p2, v1, :cond_22

    const/4 v2, 0x5

    if-eq p2, v2, :cond_1f

    const v2, 0x800003

    if-eq p2, v2, :cond_1c

    const v2, 0x800005

    if-eq p2, v2, :cond_19

    goto :goto_24

    .line 10
    :cond_19
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    goto :goto_24

    .line 11
    :cond_1c
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    goto :goto_24

    .line 12
    :cond_1f
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    goto :goto_24

    .line 13
    :cond_22
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    :goto_24
    if-eqz p1, :cond_30

    if-ne v0, v1, :cond_2b

    .line 14
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    goto :goto_2d

    :cond_2b
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    .line 15
    :goto_2d
    invoke-virtual {p2}, Lb/j/a/c;->a()V

    :cond_30
    const/4 p2, 0x1

    if-eq p1, p2, :cond_41

    const/4 p2, 0x2

    if-eq p1, p2, :cond_37

    goto :goto_4a

    .line 16
    :cond_37
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_4a

    .line 17
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->k(Landroid/view/View;)V

    goto :goto_4a

    .line 18
    :cond_41
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_4a

    .line 19
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;)V

    :cond_4a
    :goto_4a
    return-void
.end method

.method public a(IILandroid/view/View;)V
    .registers 7

    .line 34
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p1}, Lb/j/a/c;->f()I

    move-result p1

    .line 35
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {v0}, Lb/j/a/c;->f()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p1, v2, :cond_1a

    if-ne v0, v2, :cond_13

    goto :goto_1a

    :cond_13
    if-eq p1, v1, :cond_1b

    if-ne v0, v1, :cond_18

    goto :goto_1b

    :cond_18
    const/4 v1, 0x0

    goto :goto_1b

    :cond_1a
    :goto_1a
    const/4 v1, 0x1

    :cond_1b
    :goto_1b
    if-eqz p3, :cond_39

    if-nez p2, :cond_39

    .line 36
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 37
    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    const/4 p2, 0x0

    cmpl-float p2, p1, p2

    if-nez p2, :cond_30

    .line 38
    invoke-virtual {p0, p3}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroid/view/View;)V

    goto :goto_39

    :cond_30
    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-nez p1, :cond_39

    .line 39
    invoke-virtual {p0, p3}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;)V

    .line 40
    :cond_39
    :goto_39
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->r:I

    if-eq v1, p1, :cond_58

    .line 41
    iput v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->r:I

    .line 42
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-eqz p1, :cond_58

    .line 43
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v2

    :goto_48
    if-ltz p1, :cond_58

    .line 44
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/drawerlayout/widget/DrawerLayout$d;

    invoke-interface {p2, v1}, Landroidx/drawerlayout/widget/DrawerLayout$d;->a(I)V

    add-int/lit8 p1, p1, -0x1

    goto :goto_48

    :cond_58
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x1

    .line 72
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;Z)V

    return-void
.end method

.method public a(Landroid/view/View;F)V
    .registers 5

    .line 45
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-eqz v0, :cond_1a

    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_a
    if-ltz v0, :cond_1a

    .line 47
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/drawerlayout/widget/DrawerLayout$d;

    invoke-interface {v1, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout$d;->a(Landroid/view/View;F)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public a(Landroid/view/View;Z)V
    .registers 7

    .line 73
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 75
    iget-boolean v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_17

    .line 76
    iput v3, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    .line 77
    iput v2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    goto :goto_4e

    :cond_17
    const/4 v1, 0x4

    if-eqz p2, :cond_43

    .line 78
    iget p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    or-int/2addr p2, v1

    iput p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 p2, 0x3

    .line 79
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result p2

    if-eqz p2, :cond_35

    .line 80
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    neg-int v0, v0

    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    .line 82
    invoke-virtual {p2, p1, v0, v1}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    goto :goto_4e

    .line 83
    :cond_35
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {p2, p1, v0, v1}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    goto :goto_4e

    .line 84
    :cond_43
    invoke-virtual {p0, p1, v3}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroid/view/View;F)V

    .line 85
    iget p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    invoke-virtual {p0, p2, v2, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(IILandroid/view/View;)V

    .line 86
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    :goto_4e
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void

    .line 88
    :cond_52
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "View "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not a sliding drawer"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public a(Landroidx/drawerlayout/widget/DrawerLayout$d;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    .line 5
    :cond_3
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-nez v0, :cond_e

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    .line 7
    :cond_e
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Ljava/lang/Object;Z)V
    .registers 3

    .line 1
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->I:Ljava/lang/Object;

    .line 2
    iput-boolean p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->J:Z

    if-nez p2, :cond_e

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 4
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->requestLayout()V

    return-void
.end method

.method public a(Z)V
    .registers 11

    .line 56
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    if-ge v2, v0, :cond_4b

    .line 57
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 58
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 59
    invoke-virtual {p0, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_48

    if-eqz p1, :cond_20

    iget-boolean v6, v5, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->c:Z

    if-nez v6, :cond_20

    goto :goto_48

    .line 60
    :cond_20
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v6

    const/4 v7, 0x3

    .line 61
    invoke-virtual {p0, v4, v7}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 62
    iget-object v7, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    neg-int v6, v6

    .line 63
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v8

    .line 64
    invoke-virtual {v7, v4, v6, v8}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    move-result v4

    goto :goto_45

    .line 65
    :cond_37
    iget-object v6, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    .line 66
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v7

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v8

    .line 67
    invoke-virtual {v6, v4, v7, v8}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    move-result v4

    :goto_45
    or-int/2addr v3, v4

    .line 68
    iput-boolean v1, v5, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->c:Z

    :cond_48
    :goto_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 69
    :cond_4b
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->p:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-virtual {p1}, Landroidx/drawerlayout/widget/DrawerLayout$e;->c()V

    .line 70
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->q:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-virtual {p1}, Landroidx/drawerlayout/widget/DrawerLayout$e;->c()V

    if-eqz v3, :cond_5a

    .line 71
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    :cond_5a
    return-void
.end method

.method public final a(FFLandroid/view/View;)Z
    .registers 5

    .line 20
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->P:Landroid/graphics/Rect;

    if-nez v0, :cond_b

    .line 21
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->P:Landroid/graphics/Rect;

    .line 22
    :cond_b
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->P:Landroid/graphics/Rect;

    invoke-virtual {p3, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 23
    iget-object p3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->P:Landroid/graphics/Rect;

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {p3, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    return p1
.end method

.method public final a(Landroid/graphics/drawable/Drawable;I)Z
    .registers 4

    if-eqz p1, :cond_e

    .line 54
    invoke-static {p1}, Lb/h/f/l/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_e

    .line 55
    :cond_9
    invoke-static {p1, p2}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    const/4 p1, 0x1

    return p1

    :cond_e
    :goto_e
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Landroid/view/MotionEvent;Landroid/view/View;)Z
    .registers 6

    .line 24
    invoke-virtual {p2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_16

    .line 26
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroid/view/MotionEvent;Landroid/view/View;)Landroid/view/MotionEvent;

    move-result-object p1

    .line 27
    invoke-virtual {p2, p1}, Landroid/view/View;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p2

    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_36

    .line 29
    :cond_16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 32
    invoke-virtual {p2, p1}, Landroid/view/View;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p2

    neg-float v0, v0

    neg-float v1, v1

    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    :goto_36
    return p2
.end method

.method public a(Landroid/view/View;I)Z
    .registers 3

    .line 48
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->e(Landroid/view/View;)I

    move-result p1

    and-int/2addr p1, p2

    if-ne p1, p2, :cond_9

    const/4 p1, 0x1

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    return p1
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
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    move-result v0

    const/high16 v1, 0x60000

    if-ne v0, v1, :cond_9

    return-void

    .line 2
    :cond_9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_10
    if-ge v2, v0, :cond_2f

    .line 3
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {p0, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 5
    invoke-virtual {p0, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->h(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 6
    invoke-virtual {v4, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    const/4 v3, 0x1

    goto :goto_2c

    .line 7
    :cond_27
    iget-object v5, p0, Landroidx/drawerlayout/widget/DrawerLayout;->O:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2c
    :goto_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_2f
    if-nez v3, :cond_4d

    .line 8
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_37
    if-ge v1, v0, :cond_4d

    .line 9
    iget-object v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->O:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 10
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_4a

    .line 11
    invoke-virtual {v2, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 12
    :cond_4d
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->O:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->c()Landroid/view/View;

    move-result-object p2

    if-nez p2, :cond_15

    .line 3
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_10

    goto :goto_15

    :cond_10
    const/4 p2, 0x1

    .line 4
    invoke-static {p1, p2}, Lb/h/m/y;->h(Landroid/view/View;I)V

    goto :goto_19

    :cond_15
    :goto_15
    const/4 p2, 0x4

    .line 5
    invoke-static {p1, p2}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 6
    :goto_19
    sget-boolean p2, Landroidx/drawerlayout/widget/DrawerLayout;->T:Z

    if-nez p2, :cond_22

    .line 7
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->h:Landroidx/drawerlayout/widget/DrawerLayout$c;

    invoke-static {p1, p2}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    :cond_22
    return-void
.end method

.method public b(I)I
    .registers 5

    .line 3
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x3

    if-eq p1, v1, :cond_42

    const/4 v2, 0x5

    if-eq p1, v2, :cond_33

    const v2, 0x800003

    if-eq p1, v2, :cond_24

    const v2, 0x800005

    if-eq p1, v2, :cond_15

    goto :goto_51

    .line 4
    :cond_15
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    if-eq p1, v1, :cond_1a

    return p1

    :cond_1a
    if-nez v0, :cond_1f

    .line 5
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    goto :goto_21

    :cond_1f
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    :goto_21
    if-eq p1, v1, :cond_51

    return p1

    .line 6
    :cond_24
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    if-eq p1, v1, :cond_29

    return p1

    :cond_29
    if-nez v0, :cond_2e

    .line 7
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    goto :goto_30

    :cond_2e
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    :goto_30
    if-eq p1, v1, :cond_51

    return p1

    .line 8
    :cond_33
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    if-eq p1, v1, :cond_38

    return p1

    :cond_38
    if-nez v0, :cond_3d

    .line 9
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    goto :goto_3f

    :cond_3d
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    :goto_3f
    if-eq p1, v1, :cond_51

    return p1

    .line 10
    :cond_42
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    if-eq p1, v1, :cond_47

    return p1

    :cond_47
    if-nez v0, :cond_4c

    .line 11
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    goto :goto_4e

    :cond_4c
    iget p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    :goto_4e
    if-eq p1, v1, :cond_51

    return p1

    :cond_51
    :goto_51
    const/4 p1, 0x0

    return p1
.end method

.method public final b(Landroid/view/MotionEvent;Landroid/view/View;)Landroid/view/MotionEvent;
    .registers 6

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    .line 14
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    .line 15
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 16
    invoke-virtual {p2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    .line 17
    invoke-virtual {p2}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_3a

    .line 18
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->Q:Landroid/graphics/Matrix;

    if-nez v0, :cond_30

    .line 19
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->Q:Landroid/graphics/Matrix;

    .line 20
    :cond_30
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->Q:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 21
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->Q:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->transform(Landroid/graphics/Matrix;)V

    :cond_3a
    return-object p1
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Z)V

    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 5

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 23
    iget v1, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_3c

    const/4 v1, 0x0

    .line 24
    iput v1, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    .line 25
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-eqz v0, :cond_28

    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_18
    if-ltz v0, :cond_28

    .line 27
    iget-object v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/drawerlayout/widget/DrawerLayout$d;

    invoke-interface {v2, p1}, Landroidx/drawerlayout/widget/DrawerLayout$d;->b(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_18

    .line 28
    :cond_28
    invoke-virtual {p0, p1, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;Z)V

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->hasWindowFocus()Z

    move-result p1

    if-eqz p1, :cond_3c

    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_3c

    const/16 v0, 0x20

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_3c
    return-void
.end method

.method public b(Landroid/view/View;F)V
    .registers 5

    .line 32
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->f(Landroid/view/View;)F

    move-result v0

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    float-to-int v0, v0

    mul-float v1, v1, p2

    float-to-int v1, v1

    sub-int/2addr v1, v0

    const/4 v0, 0x3

    .line 34
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_18

    goto :goto_19

    :cond_18
    neg-int v1, v1

    .line 35
    :goto_19
    invoke-virtual {p1, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 36
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;F)V

    return-void
.end method

.method public b(Landroid/view/View;Z)V
    .registers 6

    .line 38
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_57

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 40
    iget-boolean v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_1b

    .line 41
    iput v2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    const/4 p2, 0x1

    .line 42
    iput p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    .line 43
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;Z)V

    goto :goto_53

    :cond_1b
    const/4 v1, 0x0

    if-eqz p2, :cond_48

    .line 44
    iget p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    or-int/lit8 p2, p2, 0x2

    iput p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 p2, 0x3

    .line 45
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result p2

    if-eqz p2, :cond_35

    .line 46
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p2, p1, v1, v0}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    goto :goto_53

    .line 47
    :cond_35
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    .line 49
    invoke-virtual {p2, p1, v0, v1}, Lb/j/a/c;->b(Landroid/view/View;II)Z

    goto :goto_53

    .line 50
    :cond_48
    invoke-virtual {p0, p1, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroid/view/View;F)V

    .line 51
    iget p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    invoke-virtual {p0, p2, v1, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(IILandroid/view/View;)V

    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    :goto_53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void

    .line 54
    :cond_57
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "View "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not a sliding drawer"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public b(Landroidx/drawerlayout/widget/DrawerLayout$d;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-nez v0, :cond_8

    return-void

    .line 2
    :cond_8
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public c()Landroid/view/View;
    .registers 6

    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1b

    .line 24
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 26
    iget v3, v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v4, 0x1

    and-int/2addr v3, v4

    if-ne v3, v4, :cond_18

    return-object v2

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    const/4 v0, 0x0

    return-object v0
.end method

.method public c(I)Ljava/lang/CharSequence;
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    .line 2
    invoke-static {p1, v0}, Lb/h/m/e;->a(II)I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_e

    .line 3
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->G:Ljava/lang/CharSequence;

    return-object p1

    :cond_e
    const/4 v0, 0x5

    if-ne p1, v0, :cond_14

    .line 4
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->H:Ljava/lang/CharSequence;

    return-object p1

    :cond_14
    const/4 p1, 0x0

    return-object p1
.end method

.method public c(Landroid/view/View;)V
    .registers 5

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 6
    iget v1, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-nez v1, :cond_35

    .line 7
    iput v2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    .line 8
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    if-eqz v0, :cond_27

    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_17
    if-ltz v0, :cond_27

    .line 10
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->A:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/drawerlayout/widget/DrawerLayout$d;

    invoke-interface {v1, p1}, Landroidx/drawerlayout/widget/DrawerLayout$d;->a(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_17

    .line 11
    :cond_27
    invoke-virtual {p0, p1, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;Z)V

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->hasWindowFocus()Z

    move-result p1

    if-eqz p1, :cond_35

    const/16 p1, 0x20

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    :cond_35
    return-void
.end method

.method public c(Landroid/view/View;F)V
    .registers 5

    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 20
    iget v1, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    cmpl-float v1, p2, v1

    if-nez v1, :cond_d

    return-void

    .line 21
    :cond_d
    iput p2, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    .line 22
    invoke-virtual {p0, p1, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;F)V

    return-void
.end method

.method public final c(Landroid/view/View;Z)V
    .registers 7

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_23

    .line 15
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez p2, :cond_13

    .line 16
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_17

    :cond_13
    if-eqz p2, :cond_1c

    if-ne v2, p1, :cond_1c

    :cond_17
    const/4 v3, 0x1

    .line 17
    invoke-static {v2, v3}, Lb/h/m/y;->h(Landroid/view/View;I)V

    goto :goto_20

    :cond_1c
    const/4 v3, 0x4

    .line 18
    invoke-static {v2, v3}, Lb/h/m/y;->h(Landroid/view/View;I)V

    :goto_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_23
    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    .line 1
    instance-of v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

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

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_1b

    .line 2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget v3, v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    .line 3
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 4
    :cond_1b
    iput v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->l:F

    .line 5
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lb/j/a/c;->a(Z)Z

    move-result v0

    .line 6
    iget-object v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {v2, v1}, Lb/j/a/c;->a(Z)Z

    move-result v1

    if-nez v0, :cond_2e

    if-eqz v1, :cond_31

    .line 7
    :cond_2e
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_31
    return-void
.end method

.method public d(Landroid/view/View;)I
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    .line 3
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->b(I)I

    move-result p1

    return p1

    .line 4
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not a drawer"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public d()Landroid/view/View;
    .registers 5

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1b

    .line 7
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 8
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->j(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    return-object v2

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    const/4 v0, 0x0

    return-object v0
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_47

    .line 2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_47

    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->l:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_18

    goto :goto_47

    .line 3
    :cond_18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_45

    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v0, v3

    :goto_28
    if-ltz v0, :cond_45

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 7
    invoke-virtual {p0, v1, v2, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->a(FFLandroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_42

    invoke-virtual {p0, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_3b

    goto :goto_42

    .line 8
    :cond_3b
    invoke-virtual {p0, p1, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/MotionEvent;Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_42

    return v3

    :cond_42
    :goto_42
    add-int/lit8 v0, v0, -0x1

    goto :goto_28

    :cond_45
    const/4 p1, 0x0

    return p1

    .line 9
    :cond_47
    :goto_47
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 19

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    .line 2
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result v4

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v5

    .line 4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v6

    const/4 v7, 0x3

    const/4 v8, 0x0

    if-eqz v4, :cond_5f

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_1e
    if-ge v10, v9, :cond_57

    .line 6
    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    if-eq v12, v2, :cond_54

    .line 7
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-nez v13, :cond_54

    .line 8
    invoke-static {v12}, Landroidx/drawerlayout/widget/DrawerLayout;->l(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_54

    invoke-virtual {p0, v12}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_54

    .line 9
    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v13

    if-ge v13, v3, :cond_3f

    goto :goto_54

    .line 10
    :cond_3f
    invoke-virtual {p0, v12, v7}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v13

    if-eqz v13, :cond_4d

    .line 11
    invoke-virtual {v12}, Landroid/view/View;->getRight()I

    move-result v12

    if-le v12, v11, :cond_54

    move v11, v12

    goto :goto_54

    .line 12
    :cond_4d
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v12

    if-ge v12, v5, :cond_54

    move v5, v12

    :cond_54
    :goto_54
    add-int/lit8 v10, v10, 0x1

    goto :goto_1e

    .line 13
    :cond_57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    invoke-virtual {p1, v11, v8, v5, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    move v8, v11

    .line 14
    :cond_5f
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v9

    .line 15
    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 16
    iget v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->l:F

    const/4 v6, 0x0

    cmpl-float v10, v3, v6

    if-lez v10, :cond_96

    if-eqz v4, :cond_96

    .line 17
    iget v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->k:I

    const/high16 v4, -0x1000000

    and-int/2addr v4, v2

    ushr-int/lit8 v4, v4, 0x18

    int-to-float v4, v4

    mul-float v4, v4, v3

    float-to-int v3, v4

    shl-int/lit8 v3, v3, 0x18

    const v4, 0xffffff

    and-int/2addr v2, v4

    or-int/2addr v2, v3

    .line 18
    iget-object v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->m:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v2, v8

    const/4 v3, 0x0

    int-to-float v4, v5

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, v0, Landroidx/drawerlayout/widget/DrawerLayout;->m:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_122

    .line 20
    :cond_96
    iget-object v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    const/high16 v4, 0x437f0000    # 255.0f

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v3, :cond_db

    .line 21
    invoke-virtual {p0, v2, v7}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_db

    .line 22
    iget-object v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    .line 23
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getRight()I

    move-result v7

    .line 24
    iget-object v8, v0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {v8}, Lb/j/a/c;->d()I

    move-result v8

    int-to-float v10, v7

    int-to-float v8, v8

    div-float/2addr v10, v8

    .line 25
    invoke-static {v10, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 26
    iget-object v6, v0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v8

    add-int/2addr v3, v7

    .line 27
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v2

    .line 28
    invoke-virtual {v6, v7, v8, v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 29
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    mul-float v5, v5, v4

    float-to-int v3, v5

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 30
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_122

    .line 31
    :cond_db
    iget-object v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_122

    const/4 v3, 0x5

    .line 32
    invoke-virtual {p0, v2, v3}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_122

    .line 33
    iget-object v3, v0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    .line 34
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v7

    .line 35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v8

    sub-int/2addr v8, v7

    .line 36
    iget-object v10, v0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {v10}, Lb/j/a/c;->d()I

    move-result v10

    int-to-float v8, v8

    int-to-float v10, v10

    div-float/2addr v8, v10

    .line 37
    invoke-static {v8, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 38
    iget-object v6, v0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    sub-int v3, v7, v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v8

    .line 39
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v2

    .line 40
    invoke-virtual {v6, v3, v8, v7, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 41
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    mul-float v5, v5, v4

    float-to-int v3, v5

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 42
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_122
    :goto_122
    return v9
.end method

.method public e(Landroid/view/View;)I
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    .line 2
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Lb/h/m/e;->a(II)I

    move-result p1

    return p1
.end method

.method public final e()Z
    .registers 5

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_1b

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 5
    iget-boolean v3, v3, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->c:Z

    if-eqz v3, :cond_18

    const/4 v0, 0x1

    return v0

    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    return v1
.end method

.method public f(Landroid/view/View;)F
    .registers 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    return p1
.end method

.method public final f()Z
    .registers 2

    .line 2
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->d()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public final g()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_10

    .line 2
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->K:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1a

    .line 3
    invoke-virtual {p0, v1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 4
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->K:Landroid/graphics/drawable/Drawable;

    return-object v0

    .line 5
    :cond_10
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->L:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1a

    .line 6
    invoke-virtual {p0, v1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 7
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->L:Landroid/graphics/drawable/Drawable;

    return-object v0

    .line 8
    :cond_1a
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->M:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public g(Landroid/view/View;)Z
    .registers 2

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    if-nez p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .line 1
    new-instance v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .line 2
    new-instance v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .line 1
    instance-of v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    if-eqz v0, :cond_c

    new-instance v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;-><init>(Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;)V

    goto :goto_1d

    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_18

    new-instance v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_1d

    :cond_18
    new-instance v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_1d
    return-object v0
.end method

.method public getDrawerElevation()F
    .registers 2

    .line 1
    sget-boolean v0, Landroidx/drawerlayout/widget/DrawerLayout;->U:Z

    if-eqz v0, :cond_7

    .line 2
    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->i:F

    return v0

    :cond_7
    const/4 v0, 0x0

    return v0
.end method

.method public getStatusBarBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final h()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_10

    .line 2
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->L:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1a

    .line 3
    invoke-virtual {p0, v1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 4
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->L:Landroid/graphics/drawable/Drawable;

    return-object v0

    .line 5
    :cond_10
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->K:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1a

    .line 6
    invoke-virtual {p0, v1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 7
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->K:Landroid/graphics/drawable/Drawable;

    return-object v0

    .line 8
    :cond_1a
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->N:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public h(Landroid/view/View;)Z
    .registers 5

    .line 9
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 11
    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-ne p1, v0, :cond_13

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    return v0

    .line 12
    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not a drawer"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final i()V
    .registers 2

    .line 1
    sget-boolean v0, Landroidx/drawerlayout/widget/DrawerLayout;->U:Z

    if-eqz v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->g()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->E:Landroid/graphics/drawable/Drawable;

    .line 3
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->h()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->F:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public i(Landroid/view/View;)Z
    .registers 4

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    .line 5
    invoke-static {p1}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result p1

    .line 6
    invoke-static {v0, p1}, Lb/h/m/e;->a(II)I

    move-result p1

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x1

    if-eqz v0, :cond_16

    return v1

    :cond_16
    and-int/lit8 p1, p1, 0x5

    if-eqz p1, :cond_1b

    return v1

    :cond_1b
    const/4 p1, 0x0

    return p1
.end method

.method public j(Landroid/view/View;)Z
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_15

    const/4 p1, 0x1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    return p1

    .line 3
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not a drawer"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public k(Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroid/view/View;Z)V

    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->J:Z

    if-eqz v0, :cond_2e

    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2e

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    const/4 v2, 0x0

    if-lt v0, v1, :cond_1d

    .line 4
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->I:Ljava/lang/Object;

    if-eqz v0, :cond_1d

    check-cast v0, Landroid/view/WindowInsets;

    .line 5
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v0

    goto :goto_1e

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    if-lez v0, :cond_2e

    .line 6
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    invoke-virtual {v1, v2, v2, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2e
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {v1, p1}, Lb/j/a/c;->c(Landroid/view/MotionEvent;)Z

    move-result v1

    iget-object v2, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    .line 3
    invoke-virtual {v2, p1}, Lb/j/a/c;->c(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_38

    if-eq v0, v2, :cond_31

    const/4 p1, 0x2

    const/4 v4, 0x3

    if-eq v0, p1, :cond_1e

    if-eq v0, v4, :cond_31

    goto :goto_36

    .line 4
    :cond_1e
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {p1, v4}, Lb/j/a/c;->a(I)Z

    move-result p1

    if-eqz p1, :cond_36

    .line 5
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->p:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-virtual {p1}, Landroidx/drawerlayout/widget/DrawerLayout$e;->c()V

    .line 6
    iget-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->q:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-virtual {p1}, Landroidx/drawerlayout/widget/DrawerLayout$e;->c()V

    goto :goto_36

    .line 7
    :cond_31
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Z)V

    .line 8
    iput-boolean v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    :cond_36
    :goto_36
    const/4 p1, 0x0

    goto :goto_60

    .line 9
    :cond_38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 11
    iput v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->B:F

    .line 12
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->C:F

    .line 13
    iget v4, p0, Landroidx/drawerlayout/widget/DrawerLayout;->l:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5d

    .line 14
    iget-object v4, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    float-to-int v0, v0

    float-to-int p1, p1

    invoke-virtual {v4, v0, p1}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5d

    .line 15
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_5d

    const/4 p1, 0x1

    goto :goto_5e

    :cond_5d
    const/4 p1, 0x0

    .line 16
    :goto_5e
    iput-boolean v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    :goto_60
    if-nez v1, :cond_70

    if-nez p1, :cond_70

    .line 17
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->e()Z

    move-result p1

    if-nez p1, :cond_70

    iget-boolean p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    if-eqz p1, :cond_6f

    goto :goto_70

    :cond_6f
    const/4 v2, 0x0

    :cond_70
    :goto_70
    return v2
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    .line 1
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->f()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    const/4 p1, 0x1

    return p1

    .line 3
    :cond_e
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_18

    .line 1
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->d()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_12

    .line 2
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->d(Landroid/view/View;)I

    move-result p2

    if-nez p2, :cond_12

    .line 3
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->b()V

    :cond_12
    if-eqz p1, :cond_16

    const/4 p1, 0x1

    goto :goto_17

    :cond_16
    const/4 p1, 0x0

    :goto_17
    return p1

    .line 4
    :cond_18
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onLayout(ZIIII)V
    .registers 22

    move-object/from16 v0, p0

    const/4 v1, 0x1

    .line 1
    iput-boolean v1, v0, Landroidx/drawerlayout/widget/DrawerLayout;->s:Z

    sub-int v2, p4, p2

    .line 2
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    const/4 v5, 0x0

    :goto_c
    if-ge v5, v3, :cond_cf

    .line 3
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 4
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_1c

    goto/16 :goto_ca

    .line 5
    :cond_1c
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 6
    invoke-virtual {v0, v6}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_3d

    .line 7
    iget v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v9, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 8
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v10, v8

    iget v7, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 9
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    add-int/2addr v7, v11

    .line 10
    invoke-virtual {v6, v8, v9, v10, v7}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_ca

    .line 11
    :cond_3d
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    .line 12
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    const/4 v10, 0x3

    .line 13
    invoke-virtual {v0, v6, v10}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroid/view/View;I)Z

    move-result v10

    if-eqz v10, :cond_59

    neg-int v10, v8

    int-to-float v11, v8

    .line 14
    iget v12, v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    mul-float v12, v12, v11

    float-to-int v12, v12

    add-int/2addr v10, v12

    add-int v12, v8, v10

    int-to-float v12, v12

    div-float/2addr v12, v11

    goto :goto_66

    :cond_59
    int-to-float v10, v8

    .line 15
    iget v11, v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    mul-float v11, v11, v10

    float-to-int v11, v11

    sub-int v11, v2, v11

    sub-int v12, v2, v11

    int-to-float v12, v12

    div-float/2addr v12, v10

    move v10, v11

    .line 16
    :goto_66
    iget v11, v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    cmpl-float v11, v12, v11

    if-eqz v11, :cond_6e

    const/4 v11, 0x1

    goto :goto_6f

    :cond_6e
    const/4 v11, 0x0

    .line 17
    :goto_6f
    iget v13, v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    and-int/lit8 v13, v13, 0x70

    const/16 v14, 0x10

    if-eq v13, v14, :cond_96

    const/16 v14, 0x50

    if-eq v13, v14, :cond_83

    .line 18
    iget v13, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v8, v10

    add-int/2addr v9, v13

    invoke-virtual {v6, v10, v13, v8, v9}, Landroid/view/View;->layout(IIII)V

    goto :goto_b2

    :cond_83
    sub-int v9, p5, p3

    .line 19
    iget v13, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int v13, v9, v13

    .line 20
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    sub-int/2addr v13, v14

    add-int/2addr v8, v10

    iget v14, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v9, v14

    .line 21
    invoke-virtual {v6, v10, v13, v8, v9}, Landroid/view/View;->layout(IIII)V

    goto :goto_b2

    :cond_96
    sub-int v13, p5, p3

    sub-int v14, v13, v9

    .line 22
    div-int/lit8 v14, v14, 0x2

    .line 23
    iget v15, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ge v14, v15, :cond_a2

    move v14, v15

    goto :goto_ad

    :cond_a2
    add-int v15, v14, v9

    .line 24
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int v4, v13, v1

    if-le v15, v4, :cond_ad

    sub-int/2addr v13, v1

    sub-int v14, v13, v9

    :cond_ad
    :goto_ad
    add-int/2addr v8, v10

    add-int/2addr v9, v14

    .line 25
    invoke-virtual {v6, v10, v14, v8, v9}, Landroid/view/View;->layout(IIII)V

    :goto_b2
    if-eqz v11, :cond_b7

    .line 26
    invoke-virtual {v0, v6, v12}, Landroidx/drawerlayout/widget/DrawerLayout;->c(Landroid/view/View;F)V

    .line 27
    :cond_b7
    iget v1, v7, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->b:F

    const/4 v4, 0x0

    cmpl-float v1, v1, v4

    if-lez v1, :cond_c0

    const/4 v1, 0x0

    goto :goto_c1

    :cond_c0
    const/4 v1, 0x4

    .line 28
    :goto_c1
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eq v4, v1, :cond_ca

    .line 29
    invoke-virtual {v6, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_ca
    :goto_ca
    add-int/lit8 v5, v5, 0x1

    const/4 v1, 0x1

    goto/16 :goto_c

    :cond_cf
    const/4 v1, 0x0

    .line 30
    iput-boolean v1, v0, Landroidx/drawerlayout/widget/DrawerLayout;->s:Z

    .line 31
    iput-boolean v1, v0, Landroidx/drawerlayout/widget/DrawerLayout;->t:Z

    return-void
.end method

.method public onMeasure(II)V
    .registers 20
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 2
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 3
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 4
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    const/16 v5, 0x12c

    const/high16 v6, 0x40000000    # 2.0f

    if-ne v1, v6, :cond_1a

    if-eq v2, v6, :cond_30

    .line 5
    :cond_1a
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_1c4

    const/high16 v7, -0x80000000

    if-ne v1, v7, :cond_25

    goto :goto_29

    :cond_25
    if-nez v1, :cond_29

    const/16 v3, 0x12c

    :cond_29
    :goto_29
    if-ne v2, v7, :cond_2c

    goto :goto_30

    :cond_2c
    if-nez v2, :cond_30

    const/16 v4, 0x12c

    .line 6
    :cond_30
    :goto_30
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 7
    iget-object v1, v0, Landroidx/drawerlayout/widget/DrawerLayout;->I:Ljava/lang/Object;

    const/4 v5, 0x0

    if-eqz v1, :cond_40

    invoke-static/range {p0 .. p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_40

    const/4 v1, 0x1

    goto :goto_41

    :cond_40
    const/4 v1, 0x0

    .line 8
    :goto_41
    invoke-static/range {p0 .. p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v7

    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_4c
    if-ge v9, v8, :cond_1c3

    .line 10
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 11
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    const/16 v14, 0x8

    if-ne v13, v14, :cond_5c

    goto/16 :goto_10d

    .line 12
    :cond_5c
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    const/4 v14, 0x3

    if-eqz v1, :cond_ec

    .line 13
    iget v15, v13, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    invoke-static {v15, v7}, Lb/h/m/e;->a(II)I

    move-result v15

    .line 14
    invoke-static {v12}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v16

    const/16 v6, 0x15

    if-eqz v16, :cond_a5

    .line 15
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v6, :cond_ec

    .line 16
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->I:Ljava/lang/Object;

    check-cast v2, Landroid/view/WindowInsets;

    if-ne v15, v14, :cond_8e

    .line 17
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v6

    .line 18
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v15

    .line 19
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v14

    .line 20
    invoke-virtual {v2, v6, v15, v5, v14}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v2

    goto :goto_a1

    :cond_8e
    const/4 v6, 0x5

    if-ne v15, v6, :cond_a1

    .line 21
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v6

    .line 22
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v14

    .line 23
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v15

    .line 24
    invoke-virtual {v2, v5, v6, v14, v15}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v2

    .line 25
    :cond_a1
    :goto_a1
    invoke-virtual {v12, v2}, Landroid/view/View;->dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    goto :goto_ec

    .line 26
    :cond_a5
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v6, :cond_ec

    .line 27
    iget-object v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->I:Ljava/lang/Object;

    check-cast v2, Landroid/view/WindowInsets;

    const/4 v6, 0x3

    if-ne v15, v6, :cond_c1

    .line 28
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v6

    .line 29
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v14

    .line 30
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v15

    .line 31
    invoke-virtual {v2, v6, v14, v5, v15}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v2

    goto :goto_d4

    :cond_c1
    const/4 v6, 0x5

    if-ne v15, v6, :cond_d4

    .line 32
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v6

    .line 33
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v14

    .line 34
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v15

    .line 35
    invoke-virtual {v2, v5, v6, v14, v15}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v2

    .line 36
    :cond_d4
    :goto_d4
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v6

    iput v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 37
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v6

    iput v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 38
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v6

    iput v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 39
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v2

    iput v2, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 40
    :cond_ec
    :goto_ec
    invoke-virtual {v0, v12}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_113

    .line 41
    iget v2, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int v2, v3, v2

    iget v6, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v2, v6

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 42
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int v14, v4, v14

    iget v13, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v14, v13

    invoke-static {v14, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 43
    invoke-virtual {v12, v2, v13}, Landroid/view/View;->measure(II)V

    :goto_10d
    move/from16 v15, p1

    move/from16 v13, p2

    goto/16 :goto_195

    :cond_113
    const/high16 v6, 0x40000000    # 2.0f

    .line 44
    invoke-virtual {v0, v12}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_19a

    .line 45
    sget-boolean v2, Landroidx/drawerlayout/widget/DrawerLayout;->U:Z

    if-eqz v2, :cond_12c

    .line 46
    invoke-static {v12}, Lb/h/m/y;->m(Landroid/view/View;)F

    move-result v2

    iget v14, v0, Landroidx/drawerlayout/widget/DrawerLayout;->i:F

    cmpl-float v2, v2, v14

    if-eqz v2, :cond_12c

    .line 47
    invoke-static {v12, v14}, Lb/h/m/y;->a(Landroid/view/View;F)V

    .line 48
    :cond_12c
    invoke-virtual {v0, v12}, Landroidx/drawerlayout/widget/DrawerLayout;->e(Landroid/view/View;)I

    move-result v2

    and-int/lit8 v2, v2, 0x7

    const/4 v14, 0x3

    if-ne v2, v14, :cond_137

    const/4 v14, 0x1

    goto :goto_138

    :cond_137
    const/4 v14, 0x0

    :goto_138
    if-eqz v14, :cond_13c

    if-nez v10, :cond_141

    :cond_13c
    if-nez v14, :cond_170

    if-nez v11, :cond_141

    goto :goto_170

    .line 49
    :cond_141
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Child drawer has absolute gravity "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    invoke-static {v2}, Landroidx/drawerlayout/widget/DrawerLayout;->d(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " but this "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "DrawerLayout"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " already has a "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "drawer view along that edge"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_170
    :goto_170
    if-eqz v14, :cond_174

    const/4 v10, 0x1

    goto :goto_175

    :cond_174
    const/4 v11, 0x1

    .line 51
    :goto_175
    iget v2, v0, Landroidx/drawerlayout/widget/DrawerLayout;->j:I

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v2, v14

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v2, v14

    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    move/from16 v15, p1

    invoke-static {v15, v2, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v2

    .line 52
    iget v14, v13, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v5, v13, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v14, v5

    iget v5, v13, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    move/from16 v13, p2

    invoke-static {v13, v14, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v5

    .line 53
    invoke-virtual {v12, v2, v5}, Landroid/view/View;->measure(II)V

    :goto_195
    add-int/lit8 v9, v9, 0x1

    const/4 v5, 0x0

    goto/16 :goto_4c

    .line 54
    :cond_19a
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Child "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " does not have a valid layout_gravity - must be Gravity.LEFT, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Gravity.RIGHT or Gravity.NO_GRAVITY"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1c3
    return-void

    .line 55
    :cond_1c4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "DrawerLayout must be measured with MeasureSpec.EXACTLY."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5

    .line 1
    instance-of v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->j:I

    if-eqz v0, :cond_1e

    .line 6
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 7
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->k(Landroid/view/View;)V

    .line 8
    :cond_1e
    iget v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->k:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_26

    .line 9
    invoke-virtual {p0, v0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    .line 10
    :cond_26
    iget v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->l:I

    if-eq v0, v1, :cond_2e

    const/4 v2, 0x5

    .line 11
    invoke-virtual {p0, v0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    .line 12
    :cond_2e
    iget v0, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->m:I

    if-eq v0, v1, :cond_38

    const v2, 0x800003

    .line 13
    invoke-virtual {p0, v0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    .line 14
    :cond_38
    iget p1, p1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->n:I

    if-eq p1, v1, :cond_42

    const v0, 0x800005

    .line 15
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    :cond_42
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->i()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 10

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;

    invoke-direct {v1, v0}, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v0, :cond_36

    .line 4
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;

    .line 6
    iget v5, v4, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_22

    const/4 v5, 0x1

    goto :goto_23

    :cond_22
    const/4 v5, 0x0

    .line 7
    :goto_23
    iget v7, v4, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->d:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v6, 0x0

    :goto_2a
    if-nez v5, :cond_32

    if-eqz v6, :cond_2f

    goto :goto_32

    :cond_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 8
    :cond_32
    :goto_32
    iget v0, v4, Landroidx/drawerlayout/widget/DrawerLayout$LayoutParams;->a:I

    iput v0, v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->j:I

    .line 9
    :cond_36
    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->u:I

    iput v0, v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->k:I

    .line 10
    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->v:I

    iput v0, v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->l:I

    .line 11
    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->w:I

    iput v0, v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->m:I

    .line 12
    iget v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->x:I

    iput v0, v1, Landroidx/drawerlayout/widget/DrawerLayout$SavedState;->n:I

    return-object v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 1
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {v0, p1}, Lb/j/a/c;->a(Landroid/view/MotionEvent;)V

    .line 2
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->o:Lb/j/a/c;

    invoke-virtual {v0, p1}, Lb/j/a/c;->a(Landroid/view/MotionEvent;)V

    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_62

    if-eq v0, v2, :cond_20

    const/4 p1, 0x3

    if-eq v0, p1, :cond_1a

    goto :goto_70

    .line 4
    :cond_1a
    invoke-virtual {p0, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Z)V

    .line 5
    iput-boolean v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    goto :goto_70

    .line 6
    :cond_20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 8
    iget-object v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    float-to-int v4, v0

    float-to-int v5, p1

    invoke-virtual {v3, v4, v5}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_5d

    .line 9
    invoke-virtual {p0, v3}, Landroidx/drawerlayout/widget/DrawerLayout;->g(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_5d

    .line 10
    iget v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->B:F

    sub-float/2addr v0, v3

    .line 11
    iget v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->C:F

    sub-float/2addr p1, v3

    .line 12
    iget-object v3, p0, Landroidx/drawerlayout/widget/DrawerLayout;->n:Lb/j/a/c;

    invoke-virtual {v3}, Lb/j/a/c;->e()I

    move-result v3

    mul-float v0, v0, v0

    mul-float p1, p1, p1

    add-float/2addr v0, p1

    mul-int v3, v3, v3

    int-to-float p1, v3

    cmpg-float p1, v0, p1

    if-gez p1, :cond_5d

    .line 13
    invoke-virtual {p0}, Landroidx/drawerlayout/widget/DrawerLayout;->c()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5d

    .line 14
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->d(Landroid/view/View;)I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_5e

    :cond_5d
    const/4 v1, 0x1

    .line 15
    :cond_5e
    invoke-virtual {p0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Z)V

    goto :goto_70

    .line 16
    :cond_62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 18
    iput v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->B:F

    .line 19
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->C:F

    .line 20
    iput-boolean v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->y:Z

    :goto_70
    return v2
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    if-eqz p1, :cond_9

    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Z)V

    :cond_9
    return-void
.end method

.method public requestLayout()V
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->s:Z

    if-nez v0, :cond_7

    .line 2
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_7
    return-void
.end method

.method public setDrawerElevation(F)V
    .registers 4

    .line 1
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->i:F

    const/4 p1, 0x0

    .line 2
    :goto_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_1b

    .line 3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->i(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 5
    iget v1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->i:F

    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;F)V

    :cond_18
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_1b
    return-void
.end method

.method public setDrawerListener(Landroidx/drawerlayout/widget/DrawerLayout$d;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->z:Landroidx/drawerlayout/widget/DrawerLayout$d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {p0, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->b(Landroidx/drawerlayout/widget/DrawerLayout$d;)V

    :cond_7
    if-eqz p1, :cond_c

    .line 3
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroidx/drawerlayout/widget/DrawerLayout$d;)V

    .line 4
    :cond_c
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->z:Landroidx/drawerlayout/widget/DrawerLayout$d;

    return-void
.end method

.method public setDrawerLockMode(I)V
    .registers 3

    const/4 v0, 0x3

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, p1, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->a(II)V

    return-void
.end method

.method public setScrimColor(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->k:I

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setStatusBarBackground(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .registers 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout;->D:Landroid/graphics/drawable/Drawable;

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method
