.class public Lc/a/a/a/l0/m;
.super Ljava/lang/Object;
.source "ShapeAppearanceModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/l0/m$c;,
        Lc/a/a/a/l0/m$b;
    }
.end annotation


# static fields
.field public static final m:Lc/a/a/a/l0/c;


# instance fields
.field public a:Lc/a/a/a/l0/d;

.field public b:Lc/a/a/a/l0/d;

.field public c:Lc/a/a/a/l0/d;

.field public d:Lc/a/a/a/l0/d;

.field public e:Lc/a/a/a/l0/c;

.field public f:Lc/a/a/a/l0/c;

.field public g:Lc/a/a/a/l0/c;

.field public h:Lc/a/a/a/l0/c;

.field public i:Lc/a/a/a/l0/f;

.field public j:Lc/a/a/a/l0/f;

.field public k:Lc/a/a/a/l0/f;

.field public l:Lc/a/a/a/l0/f;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/a/a/a/l0/k;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-direct {v0, v1}, Lc/a/a/a/l0/k;-><init>(F)V

    sput-object v0, Lc/a/a/a/l0/m;->m:Lc/a/a/a/l0/c;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    invoke-static {}, Lc/a/a/a/l0/i;->a()Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->a:Lc/a/a/a/l0/d;

    .line 17
    invoke-static {}, Lc/a/a/a/l0/i;->a()Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->b:Lc/a/a/a/l0/d;

    .line 18
    invoke-static {}, Lc/a/a/a/l0/i;->a()Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->c:Lc/a/a/a/l0/d;

    .line 19
    invoke-static {}, Lc/a/a/a/l0/i;->a()Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->d:Lc/a/a/a/l0/d;

    .line 20
    new-instance v0, Lc/a/a/a/l0/a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lc/a/a/a/l0/a;-><init>(F)V

    iput-object v0, p0, Lc/a/a/a/l0/m;->e:Lc/a/a/a/l0/c;

    .line 21
    new-instance v0, Lc/a/a/a/l0/a;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/a;-><init>(F)V

    iput-object v0, p0, Lc/a/a/a/l0/m;->f:Lc/a/a/a/l0/c;

    .line 22
    new-instance v0, Lc/a/a/a/l0/a;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/a;-><init>(F)V

    iput-object v0, p0, Lc/a/a/a/l0/m;->g:Lc/a/a/a/l0/c;

    .line 23
    new-instance v0, Lc/a/a/a/l0/a;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/a;-><init>(F)V

    iput-object v0, p0, Lc/a/a/a/l0/m;->h:Lc/a/a/a/l0/c;

    .line 24
    invoke-static {}, Lc/a/a/a/l0/i;->b()Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->i:Lc/a/a/a/l0/f;

    .line 25
    invoke-static {}, Lc/a/a/a/l0/i;->b()Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->j:Lc/a/a/a/l0/f;

    .line 26
    invoke-static {}, Lc/a/a/a/l0/i;->b()Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->k:Lc/a/a/a/l0/f;

    .line 27
    invoke-static {}, Lc/a/a/a/l0/i;->b()Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->l:Lc/a/a/a/l0/f;

    return-void
.end method

.method public constructor <init>(Lc/a/a/a/l0/m$b;)V
    .registers 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->a(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->a:Lc/a/a/a/l0/d;

    .line 4
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->e(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->b:Lc/a/a/a/l0/d;

    .line 5
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->f(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->c:Lc/a/a/a/l0/d;

    .line 6
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->g(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/d;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->d:Lc/a/a/a/l0/d;

    .line 7
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->h(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/c;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->e:Lc/a/a/a/l0/c;

    .line 8
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->i(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/c;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->f:Lc/a/a/a/l0/c;

    .line 9
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->j(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/c;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->g:Lc/a/a/a/l0/c;

    .line 10
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->k(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/c;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->h:Lc/a/a/a/l0/c;

    .line 11
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->l(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->i:Lc/a/a/a/l0/f;

    .line 12
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->b(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->j:Lc/a/a/a/l0/f;

    .line 13
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->c(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/f;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/m;->k:Lc/a/a/a/l0/f;

    .line 14
    invoke-static {p1}, Lc/a/a/a/l0/m$b;->d(Lc/a/a/a/l0/m$b;)Lc/a/a/a/l0/f;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/l0/m;->l:Lc/a/a/a/l0/f;

    return-void
.end method

.method public synthetic constructor <init>(Lc/a/a/a/l0/m$b;Lc/a/a/a/l0/m$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/l0/m;-><init>(Lc/a/a/a/l0/m$b;)V

    return-void
.end method

.method public static a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;
    .registers 5

    .line 41
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p1

    if-nez p1, :cond_7

    return-object p2

    .line 42
    :cond_7
    iget v0, p1, Landroid/util/TypedValue;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_21

    .line 43
    new-instance p2, Lc/a/a/a/l0/a;

    iget p1, p1, Landroid/util/TypedValue;->data:I

    .line 44
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result p0

    int-to-float p0, p0

    invoke-direct {p2, p0}, Lc/a/a/a/l0/a;-><init>(F)V

    return-object p2

    :cond_21
    const/4 p0, 0x6

    if-ne v0, p0, :cond_30

    .line 45
    new-instance p0, Lc/a/a/a/l0/k;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2, p2}, Landroid/util/TypedValue;->getFraction(FF)F

    move-result p1

    invoke-direct {p0, p1}, Lc/a/a/a/l0/k;-><init>(F)V

    return-object p0

    :cond_30
    return-object p2
.end method

.method public static a(Landroid/content/Context;II)Lc/a/a/a/l0/m$b;
    .registers 4

    const/4 v0, 0x0

    .line 10
    invoke-static {p0, p1, p2, v0}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;III)Lc/a/a/a/l0/m$b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;III)Lc/a/a/a/l0/m$b;
    .registers 5

    .line 11
    new-instance v0, Lc/a/a/a/l0/a;

    int-to-float p3, p3

    invoke-direct {v0, p3}, Lc/a/a/a/l0/a;-><init>(F)V

    invoke-static {p0, p1, p2, v0}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;
    .registers 10

    if-eqz p2, :cond_9

    .line 12
    new-instance v0, Landroid/view/ContextThemeWrapper;

    invoke-direct {v0, p0, p1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    move p1, p2

    move-object p0, v0

    .line 13
    :cond_9
    sget-object p2, Lc/a/a/a/l;->ShapeAppearance:[I

    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    .line 15
    :try_start_f
    sget p1, Lc/a/a/a/l;->ShapeAppearance_cornerFamily:I

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    .line 16
    sget p2, Lc/a/a/a/l;->ShapeAppearance_cornerFamilyTopLeft:I

    .line 17
    invoke-virtual {p0, p2, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    .line 18
    sget v0, Lc/a/a/a/l;->ShapeAppearance_cornerFamilyTopRight:I

    .line 19
    invoke-virtual {p0, v0, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    .line 20
    sget v1, Lc/a/a/a/l;->ShapeAppearance_cornerFamilyBottomRight:I

    .line 21
    invoke-virtual {p0, v1, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 22
    sget v2, Lc/a/a/a/l;->ShapeAppearance_cornerFamilyBottomLeft:I

    .line 23
    invoke-virtual {p0, v2, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    .line 24
    sget v2, Lc/a/a/a/l;->ShapeAppearance_cornerSize:I

    .line 25
    invoke-static {p0, v2, p3}, Lc/a/a/a/l0/m;->a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object p3

    .line 26
    sget v2, Lc/a/a/a/l;->ShapeAppearance_cornerSizeTopLeft:I

    .line 27
    invoke-static {p0, v2, p3}, Lc/a/a/a/l0/m;->a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v2

    .line 28
    sget v3, Lc/a/a/a/l;->ShapeAppearance_cornerSizeTopRight:I

    .line 29
    invoke-static {p0, v3, p3}, Lc/a/a/a/l0/m;->a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v3

    .line 30
    sget v4, Lc/a/a/a/l;->ShapeAppearance_cornerSizeBottomRight:I

    .line 31
    invoke-static {p0, v4, p3}, Lc/a/a/a/l0/m;->a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v4

    .line 32
    sget v5, Lc/a/a/a/l;->ShapeAppearance_cornerSizeBottomLeft:I

    .line 33
    invoke-static {p0, v5, p3}, Lc/a/a/a/l0/m;->a(Landroid/content/res/TypedArray;ILc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object p3

    .line 34
    new-instance v5, Lc/a/a/a/l0/m$b;

    invoke-direct {v5}, Lc/a/a/a/l0/m$b;-><init>()V

    .line 35
    invoke-virtual {v5, p2, v2}, Lc/a/a/a/l0/m$b;->c(ILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 36
    invoke-virtual {v5, v0, v3}, Lc/a/a/a/l0/m$b;->d(ILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 37
    invoke-virtual {v5, v1, v4}, Lc/a/a/a/l0/m$b;->b(ILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 38
    invoke-virtual {v5, p1, p3}, Lc/a/a/a/l0/m$b;->a(ILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;
    :try_end_5d
    .catchall {:try_start_f .. :try_end_5d} :catchall_61

    .line 39
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-object v5

    :catchall_61
    move-exception p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 40
    throw p1
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;
    .registers 5

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, p2, p3, v0}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;III)Lc/a/a/a/l0/m$b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;III)Lc/a/a/a/l0/m$b;
    .registers 6

    .line 2
    new-instance v0, Lc/a/a/a/l0/a;

    int-to-float p4, p4

    invoke-direct {v0, p4}, Lc/a/a/a/l0/a;-><init>(F)V

    invoke-static {p0, p1, p2, p3, v0}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;
    .registers 6

    .line 3
    sget-object v0, Lc/a/a/a/l;->MaterialShape:[I

    .line 4
    invoke-virtual {p0, p1, v0, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    sget p2, Lc/a/a/a/l;->MaterialShape_shapeAppearance:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    .line 6
    sget v0, Lc/a/a/a/l;->MaterialShape_shapeAppearanceOverlay:I

    .line 7
    invoke-virtual {p1, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    .line 8
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 9
    invoke-static {p0, p2, p3, p4}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;IILc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    move-result-object p0

    return-object p0
.end method

.method public static n()Lc/a/a/a/l0/m$b;
    .registers 1

    .line 1
    new-instance v0, Lc/a/a/a/l0/m$b;

    invoke-direct {v0}, Lc/a/a/a/l0/m$b;-><init>()V

    return-object v0
.end method


# virtual methods
.method public a()Lc/a/a/a/l0/f;
    .registers 2

    .line 46
    iget-object v0, p0, Lc/a/a/a/l0/m;->k:Lc/a/a/a/l0/f;

    return-object v0
.end method

.method public a(F)Lc/a/a/a/l0/m;
    .registers 3

    .line 47
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m$b;->a(F)Lc/a/a/a/l0/m$b;

    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    return-object p1
.end method

.method public a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m;
    .registers 3

    .line 48
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m$b;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    return-object p1
.end method

.method public a(Lc/a/a/a/l0/m$c;)Lc/a/a/a/l0/m;
    .registers 4

    .line 49
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object v0

    .line 50
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->j()Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-interface {p1, v1}, Lc/a/a/a/l0/m$c;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/m$b;->d(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 51
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->l()Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-interface {p1, v1}, Lc/a/a/a/l0/m$c;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/m$b;->e(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 52
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->c()Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-interface {p1, v1}, Lc/a/a/a/l0/m$c;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/m$b;->b(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 53
    invoke-virtual {p0}, Lc/a/a/a/l0/m;->e()Lc/a/a/a/l0/c;

    move-result-object v1

    invoke-interface {p1, v1}, Lc/a/a/a/l0/m$c;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/c;

    move-result-object p1

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m$b;->c(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m$b;

    .line 54
    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/graphics/RectF;)Z
    .registers 7

    .line 55
    const-class v0, Lc/a/a/a/l0/f;

    iget-object v1, p0, Lc/a/a/a/l0/m;->l:Lc/a/a/a/l0/f;

    .line 56
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_36

    iget-object v1, p0, Lc/a/a/a/l0/m;->j:Lc/a/a/a/l0/f;

    .line 57
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v1, p0, Lc/a/a/a/l0/m;->i:Lc/a/a/a/l0/f;

    .line 58
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v1, p0, Lc/a/a/a/l0/m;->k:Lc/a/a/a/l0/f;

    .line 59
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    const/4 v0, 0x1

    goto :goto_37

    :cond_36
    const/4 v0, 0x0

    .line 60
    :goto_37
    iget-object v1, p0, Lc/a/a/a/l0/m;->e:Lc/a/a/a/l0/c;

    invoke-interface {v1, p1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v1

    .line 61
    iget-object v4, p0, Lc/a/a/a/l0/m;->f:Lc/a/a/a/l0/c;

    .line 62
    invoke-interface {v4, p1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v4

    cmpl-float v4, v4, v1

    if-nez v4, :cond_5d

    iget-object v4, p0, Lc/a/a/a/l0/m;->h:Lc/a/a/a/l0/c;

    .line 63
    invoke-interface {v4, p1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v4

    cmpl-float v4, v4, v1

    if-nez v4, :cond_5d

    iget-object v4, p0, Lc/a/a/a/l0/m;->g:Lc/a/a/a/l0/c;

    .line 64
    invoke-interface {v4, p1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result p1

    cmpl-float p1, p1, v1

    if-nez p1, :cond_5d

    const/4 p1, 0x1

    goto :goto_5e

    :cond_5d
    const/4 p1, 0x0

    .line 65
    :goto_5e
    iget-object v1, p0, Lc/a/a/a/l0/m;->b:Lc/a/a/a/l0/d;

    instance-of v1, v1, Lc/a/a/a/l0/l;

    if-eqz v1, :cond_78

    iget-object v1, p0, Lc/a/a/a/l0/m;->a:Lc/a/a/a/l0/d;

    instance-of v1, v1, Lc/a/a/a/l0/l;

    if-eqz v1, :cond_78

    iget-object v1, p0, Lc/a/a/a/l0/m;->c:Lc/a/a/a/l0/d;

    instance-of v1, v1, Lc/a/a/a/l0/l;

    if-eqz v1, :cond_78

    iget-object v1, p0, Lc/a/a/a/l0/m;->d:Lc/a/a/a/l0/d;

    instance-of v1, v1, Lc/a/a/a/l0/l;

    if-eqz v1, :cond_78

    const/4 v1, 0x1

    goto :goto_79

    :cond_78
    const/4 v1, 0x0

    :goto_79
    if-eqz v0, :cond_80

    if-eqz p1, :cond_80

    if-eqz v1, :cond_80

    goto :goto_81

    :cond_80
    const/4 v2, 0x0

    :goto_81
    return v2
.end method

.method public b()Lc/a/a/a/l0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->d:Lc/a/a/a/l0/d;

    return-object v0
.end method

.method public c()Lc/a/a/a/l0/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->h:Lc/a/a/a/l0/c;

    return-object v0
.end method

.method public d()Lc/a/a/a/l0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->c:Lc/a/a/a/l0/d;

    return-object v0
.end method

.method public e()Lc/a/a/a/l0/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->g:Lc/a/a/a/l0/c;

    return-object v0
.end method

.method public f()Lc/a/a/a/l0/f;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->l:Lc/a/a/a/l0/f;

    return-object v0
.end method

.method public g()Lc/a/a/a/l0/f;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->j:Lc/a/a/a/l0/f;

    return-object v0
.end method

.method public h()Lc/a/a/a/l0/f;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->i:Lc/a/a/a/l0/f;

    return-object v0
.end method

.method public i()Lc/a/a/a/l0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->a:Lc/a/a/a/l0/d;

    return-object v0
.end method

.method public j()Lc/a/a/a/l0/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->e:Lc/a/a/a/l0/c;

    return-object v0
.end method

.method public k()Lc/a/a/a/l0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->b:Lc/a/a/a/l0/d;

    return-object v0
.end method

.method public l()Lc/a/a/a/l0/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/m;->f:Lc/a/a/a/l0/c;

    return-object v0
.end method

.method public m()Lc/a/a/a/l0/m$b;
    .registers 2

    .line 1
    new-instance v0, Lc/a/a/a/l0/m$b;

    invoke-direct {v0, p0}, Lc/a/a/a/l0/m$b;-><init>(Lc/a/a/a/l0/m;)V

    return-object v0
.end method
