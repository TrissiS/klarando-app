.class public Lc/a/a/a/l0/h;
.super Landroid/graphics/drawable/Drawable;
.source "MaterialShapeDrawable.java"

# interfaces
.implements Lb/h/f/l/b;
.implements Lc/a/a/a/l0/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/l0/h$c;
    }
.end annotation


# static fields
.field public static final D:Ljava/lang/String;

.field public static final E:Landroid/graphics/Paint;


# instance fields
.field public A:Landroid/graphics/PorterDuffColorFilter;

.field public final B:Landroid/graphics/RectF;

.field public C:Z

.field public h:Lc/a/a/a/l0/h$c;

.field public final i:[Lc/a/a/a/l0/o$g;

.field public final j:[Lc/a/a/a/l0/o$g;

.field public final k:Ljava/util/BitSet;

.field public l:Z

.field public final m:Landroid/graphics/Matrix;

.field public final n:Landroid/graphics/Path;

.field public final o:Landroid/graphics/Path;

.field public final p:Landroid/graphics/RectF;

.field public final q:Landroid/graphics/RectF;

.field public final r:Landroid/graphics/Region;

.field public final s:Landroid/graphics/Region;

.field public t:Lc/a/a/a/l0/m;

.field public final u:Landroid/graphics/Paint;

.field public final v:Landroid/graphics/Paint;

.field public final w:Lc/a/a/a/k0/a;

.field public final x:Lc/a/a/a/l0/n$b;

.field public final y:Lc/a/a/a/l0/n;

.field public z:Landroid/graphics/PorterDuffColorFilter;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    const-class v0, Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lc/a/a/a/l0/h;->D:Ljava/lang/String;

    .line 2
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lc/a/a/a/l0/h;->E:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 2
    new-instance v0, Lc/a/a/a/l0/m;

    invoke-direct {v0}, Lc/a/a/a/l0/m;-><init>()V

    invoke-direct {p0, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 3
    invoke-static {p1, p2, p3, p4}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-direct {p0, p1}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public constructor <init>(Lc/a/a/a/l0/h$c;)V
    .registers 5

    .line 5
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [Lc/a/a/a/l0/o$g;

    .line 6
    iput-object v1, p0, Lc/a/a/a/l0/h;->i:[Lc/a/a/a/l0/o$g;

    new-array v0, v0, [Lc/a/a/a/l0/o$g;

    .line 7
    iput-object v0, p0, Lc/a/a/a/l0/h;->j:[Lc/a/a/a/l0/o$g;

    .line 8
    new-instance v0, Ljava/util/BitSet;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v0, p0, Lc/a/a/a/l0/h;->k:Ljava/util/BitSet;

    .line 9
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->m:Landroid/graphics/Matrix;

    .line 10
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    .line 11
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->o:Landroid/graphics/Path;

    .line 12
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->p:Landroid/graphics/RectF;

    .line 13
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->q:Landroid/graphics/RectF;

    .line 14
    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->r:Landroid/graphics/Region;

    .line 15
    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->s:Landroid/graphics/Region;

    .line 16
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    .line 17
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    .line 18
    new-instance v0, Lc/a/a/a/k0/a;

    invoke-direct {v0}, Lc/a/a/a/k0/a;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    .line 19
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    if-ne v0, v2, :cond_6f

    .line 20
    invoke-static {}, Lc/a/a/a/l0/n;->a()Lc/a/a/a/l0/n;

    move-result-object v0

    goto :goto_74

    :cond_6f
    new-instance v0, Lc/a/a/a/l0/n;

    invoke-direct {v0}, Lc/a/a/a/l0/n;-><init>()V

    :goto_74
    iput-object v0, p0, Lc/a/a/a/l0/h;->y:Lc/a/a/a/l0/n;

    .line 21
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    .line 22
    iput-boolean v1, p0, Lc/a/a/a/l0/h;->C:Z

    .line 23
    iput-object p1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    .line 24
    iget-object p1, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 25
    iget-object p1, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    sget-object p1, Lc/a/a/a/l0/h;->E:Landroid/graphics/Paint;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    sget-object p1, Lc/a/a/a/l0/h;->E:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 28
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->D()Z

    .line 29
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a([I)Z

    .line 30
    new-instance p1, Lc/a/a/a/l0/h$a;

    invoke-direct {p1, p0}, Lc/a/a/a/l0/h$a;-><init>(Lc/a/a/a/l0/h;)V

    iput-object p1, p0, Lc/a/a/a/l0/h;->x:Lc/a/a/a/l0/n$b;

    return-void
.end method

.method public synthetic constructor <init>(Lc/a/a/a/l0/h$c;Lc/a/a/a/l0/h$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/h$c;)V

    return-void
.end method

.method public constructor <init>(Lc/a/a/a/l0/m;)V
    .registers 4

    .line 4
    new-instance v0, Lc/a/a/a/l0/h$c;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lc/a/a/a/l0/h$c;-><init>(Lc/a/a/a/l0/m;Lc/a/a/a/a0/a;)V

    invoke-direct {p0, v0}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/h$c;)V

    return-void
.end method

.method public static a(II)I
    .registers 3

    ushr-int/lit8 v0, p1, 0x7

    add-int/2addr p1, v0

    mul-int p0, p0, p1

    ushr-int/lit8 p0, p0, 0x8

    return p0
.end method

.method public static a(Landroid/content/Context;F)Lc/a/a/a/l0/h;
    .registers 4

    .line 3
    sget v0, Lc/a/a/a/b;->colorSurface:I

    const-class v1, Lc/a/a/a/l0/h;

    .line 4
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-static {p0, v0, v1}, Lc/a/a/a/w/a;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result v0

    .line 6
    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1}, Lc/a/a/a/l0/h;-><init>()V

    .line 7
    invoke-virtual {v1, p0}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 8
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 9
    invoke-virtual {v1, p1}, Lc/a/a/a/l0/h;->b(F)V

    return-object v1
.end method

.method public static synthetic a(Lc/a/a/a/l0/h;)Ljava/util/BitSet;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/l0/h;->k:Ljava/util/BitSet;

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/l0/h;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/l0/h;->l:Z

    return p1
.end method

.method public static synthetic b(Lc/a/a/a/l0/h;)[Lc/a/a/a/l0/o$g;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/l0/h;->i:[Lc/a/a/a/l0/o$g;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/l0/h;)[Lc/a/a/a/l0/o$g;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/l0/h;->j:[Lc/a/a/a/l0/o$g;

    return-object p0
.end method


# virtual methods
.method public A()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->b:Lc/a/a/a/a0/a;

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/a0/a;->a()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public B()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/l0/m;->a(Landroid/graphics/RectF;)Z

    move-result v0

    return v0
.end method

.method public C()Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1d

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->B()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->isConvex()Z

    move-result v0

    if-nez v0, :cond_1b

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 v0, 0x1

    :goto_1e
    return v0
.end method

.method public final D()Z
    .registers 8

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->z:Landroid/graphics/PorterDuffColorFilter;

    .line 2
    iget-object v1, p0, Lc/a/a/a/l0/h;->A:Landroid/graphics/PorterDuffColorFilter;

    .line 3
    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v3, v2, Lc/a/a/a/l0/h$c;->g:Landroid/content/res/ColorStateList;

    iget-object v2, v2, Lc/a/a/a/l0/h$c;->h:Landroid/graphics/PorterDuff$Mode;

    iget-object v4, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    const/4 v5, 0x1

    .line 4
    invoke-virtual {p0, v3, v2, v4, v5}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    iput-object v2, p0, Lc/a/a/a/l0/h;->z:Landroid/graphics/PorterDuffColorFilter;

    .line 5
    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v3, v2, Lc/a/a/a/l0/h$c;->f:Landroid/content/res/ColorStateList;

    iget-object v2, v2, Lc/a/a/a/l0/h$c;->h:Landroid/graphics/PorterDuff$Mode;

    iget-object v4, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    const/4 v6, 0x0

    .line 6
    invoke-virtual {p0, v3, v2, v4, v6}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    iput-object v2, p0, Lc/a/a/a/l0/h;->A:Landroid/graphics/PorterDuffColorFilter;

    .line 7
    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-boolean v3, v2, Lc/a/a/a/l0/h$c;->u:Z

    if-eqz v3, :cond_37

    .line 8
    iget-object v3, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    iget-object v2, v2, Lc/a/a/a/l0/h$c;->g:Landroid/content/res/ColorStateList;

    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v4

    invoke-virtual {v2, v4, v6}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    .line 10
    invoke-virtual {v3, v2}, Lc/a/a/a/k0/a;->a(I)V

    .line 11
    :cond_37
    iget-object v2, p0, Lc/a/a/a/l0/h;->z:Landroid/graphics/PorterDuffColorFilter;

    invoke-static {v0, v2}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    iget-object v0, p0, Lc/a/a/a/l0/h;->A:Landroid/graphics/PorterDuffColorFilter;

    .line 12
    invoke-static {v1, v0}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_48

    goto :goto_49

    :cond_48
    const/4 v5, 0x0

    :cond_49
    :goto_49
    return v5
.end method

.method public final E()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->v()F

    move-result v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    const/high16 v2, 0x3f400000    # 0.75f

    mul-float v2, v2, v0

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    iput v2, v1, Lc/a/a/a/l0/h$c;->r:I

    .line 3
    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    const/high16 v2, 0x3e800000    # 0.25f

    mul-float v0, v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    iput v0, v1, Lc/a/a/a/l0/h$c;->s:I

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->D()Z

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    return-void
.end method

.method public a(I)I
    .registers 4

    .line 25
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->v()F

    move-result v0

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->j()F

    move-result v1

    add-float/2addr v0, v1

    .line 26
    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v1, v1, Lc/a/a/a/l0/h$c;->b:Lc/a/a/a/a0/a;

    if-eqz v1, :cond_13

    .line 27
    invoke-virtual {v1, p1, v0}, Lc/a/a/a/a0/a;->b(IF)I

    move-result p1

    :cond_13
    return p1
.end method

.method public final a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;
    .registers 5

    if-eqz p1, :cond_a

    if-nez p2, :cond_5

    goto :goto_a

    .line 56
    :cond_5
    invoke-virtual {p0, p1, p2, p4}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    goto :goto_e

    .line 57
    :cond_a
    :goto_a
    invoke-virtual {p0, p3, p4}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    :goto_e
    return-object p1
.end method

.method public final a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Z)Landroid/graphics/PorterDuffColorFilter;
    .registers 6

    .line 61
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    if-eqz p3, :cond_f

    .line 62
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a(I)I

    move-result p1

    .line 63
    :cond_f
    new-instance p3, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {p3, p1, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    return-object p3
.end method

.method public final a(Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;
    .registers 4

    if-eqz p2, :cond_14

    .line 58
    invoke-virtual {p1}, Landroid/graphics/Paint;->getColor()I

    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a(I)I

    move-result p2

    if-eq p2, p1, :cond_14

    .line 60
    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    return-object p1

    :cond_14
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(F)V
    .registers 3

    .line 17
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m;->a(F)Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public a(FI)V
    .registers 3

    .line 13
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->e(F)V

    .line 14
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public a(FLandroid/content/res/ColorStateList;)V
    .registers 3

    .line 15
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->e(F)V

    .line 16
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/h;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public a(IIII)V
    .registers 7

    .line 19
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v1, v0, Lc/a/a/a/l0/h$c;->i:Landroid/graphics/Rect;

    if-nez v1, :cond_d

    .line 20
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lc/a/a/a/l0/h$c;->i:Landroid/graphics/Rect;

    .line 21
    :cond_d
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->i:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 22
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .registers 4

    .line 23
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    new-instance v1, Lc/a/a/a/a0/a;

    invoke-direct {v1, p1}, Lc/a/a/a/a0/a;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lc/a/a/a/l0/h$c;->b:Lc/a/a/a/a0/a;

    .line 24
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->E()V

    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 10
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v1, v0, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_f

    .line 11
    iput-object p1, v0, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->onStateChange([I)Z

    :cond_f
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 6

    .line 36
    iget-object v0, p0, Lc/a/a/a/l0/h;->k:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    if-lez v0, :cond_f

    .line 37
    sget-object v0, Lc/a/a/a/l0/h;->D:Ljava/lang/String;

    const-string v1, "Compatibility shadow requested but can\'t be drawn for all operations in this shape."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    :cond_f
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->s:I

    if-eqz v0, :cond_20

    .line 39
    iget-object v0, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    iget-object v1, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    invoke-virtual {v1}, Lc/a/a/a/k0/a;->a()Landroid/graphics/Paint;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_20
    const/4 v0, 0x0

    :goto_21
    const/4 v1, 0x4

    if-ge v0, v1, :cond_41

    .line 40
    iget-object v1, p0, Lc/a/a/a/l0/h;->i:[Lc/a/a/a/l0/o$g;

    aget-object v1, v1, v0

    iget-object v2, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v3, v3, Lc/a/a/a/l0/h$c;->r:I

    invoke-virtual {v1, v2, v3, p1}, Lc/a/a/a/l0/o$g;->a(Lc/a/a/a/k0/a;ILandroid/graphics/Canvas;)V

    .line 41
    iget-object v1, p0, Lc/a/a/a/l0/h;->j:[Lc/a/a/a/l0/o$g;

    aget-object v1, v1, v0

    iget-object v2, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v3, v3, Lc/a/a/a/l0/h$c;->r:I

    invoke-virtual {v1, v2, v3, p1}, Lc/a/a/a/l0/o$g;->a(Lc/a/a/a/k0/a;ILandroid/graphics/Canvas;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 42
    :cond_41
    iget-boolean v0, p0, Lc/a/a/a/l0/h;->C:Z

    if-eqz v0, :cond_60

    .line 43
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->k()I

    move-result v0

    .line 44
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->l()I

    move-result v1

    neg-int v2, v0

    int-to-float v2, v2

    neg-int v3, v1

    int-to-float v3, v3

    .line 45
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 46
    iget-object v2, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    sget-object v3, Lc/a/a/a/l0/h;->E:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    int-to-float v0, v0

    int-to-float v1, v1

    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_60
    return-void
.end method

.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Landroid/graphics/RectF;)V
    .registers 12

    .line 31
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v5, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lc/a/a/a/l0/m;Landroid/graphics/RectF;)V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lc/a/a/a/l0/m;Landroid/graphics/RectF;)V
    .registers 7

    .line 32
    invoke-virtual {p4, p5}, Lc/a/a/a/l0/m;->a(Landroid/graphics/RectF;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 33
    invoke-virtual {p4}, Lc/a/a/a/l0/m;->l()Lc/a/a/a/l0/c;

    move-result-object p3

    invoke-interface {p3, p5}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result p3

    iget-object p4, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget p4, p4, Lc/a/a/a/l0/h$c;->k:F

    mul-float p3, p3, p4

    .line 34
    invoke-virtual {p1, p5, p3, p3, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_1b

    .line 35
    :cond_18
    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :goto_1b
    return-void
.end method

.method public a(Landroid/graphics/Paint$Style;)V
    .registers 3

    .line 29
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iput-object p1, v0, Lc/a/a/a/l0/h$c;->v:Landroid/graphics/Paint$Style;

    .line 30
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    return-void
.end method

.method public final a(Landroid/graphics/RectF;Landroid/graphics/Path;)V
    .registers 7

    .line 48
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/l0/h;->b(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 49
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->j:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2c

    .line 50
    iget-object v0, p0, Lc/a/a/a/l0/h;->m:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 51
    iget-object v0, p0, Lc/a/a/a/l0/h;->m:Landroid/graphics/Matrix;

    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v1, Lc/a/a/a/l0/h$c;->j:F

    .line 52
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr p1, v3

    .line 53
    invoke-virtual {v0, v1, v1, v2, p1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 54
    iget-object p1, p0, Lc/a/a/a/l0/h;->m:Landroid/graphics/Matrix;

    invoke-virtual {p2, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 55
    :cond_2c
    iget-object p1, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    return-void
.end method

.method public a(Lc/a/a/a/l0/c;)V
    .registers 3

    .line 18
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m;->a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 28
    iput-boolean p1, p0, Lc/a/a/a/l0/h;->C:Z

    return-void
.end method

.method public final a([I)Z
    .registers 6

    .line 64
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    const/4 v1, 0x1

    if-eqz v0, :cond_1e

    .line 65
    iget-object v0, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    .line 66
    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v2, v2, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    invoke-virtual {v2, p1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    if-eq v0, v2, :cond_1e

    .line 67
    iget-object v0, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    .line 68
    :goto_1f
    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v2, v2, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    if-eqz v2, :cond_3b

    .line 69
    iget-object v2, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    .line 70
    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v3, v3, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    .line 71
    invoke-virtual {v3, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    if-eq v2, p1, :cond_3b

    .line 72
    iget-object v0, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_3c

    :cond_3b
    move v1, v0

    :goto_3c
    return v1
.end method

.method public final b()V
    .registers 6

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->p()F

    move-result v0

    neg-float v0, v0

    .line 14
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v1

    new-instance v2, Lc/a/a/a/l0/h$b;

    invoke-direct {v2, p0, v0}, Lc/a/a/a/l0/h$b;-><init>(Lc/a/a/a/l0/h;F)V

    .line 15
    invoke-virtual {v1, v2}, Lc/a/a/a/l0/m;->a(Lc/a/a/a/l0/m$c;)Lc/a/a/a/l0/m;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/l0/h;->t:Lc/a/a/a/l0/m;

    .line 16
    iget-object v1, p0, Lc/a/a/a/l0/h;->y:Lc/a/a/a/l0/n;

    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v2, v2, Lc/a/a/a/l0/h$c;->k:F

    .line 17
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->f()Landroid/graphics/RectF;

    move-result-object v3

    iget-object v4, p0, Lc/a/a/a/l0/h;->o:Landroid/graphics/Path;

    .line 18
    invoke-virtual {v1, v0, v2, v3, v4}, Lc/a/a/a/l0/n;->a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Landroid/graphics/Path;)V

    return-void
.end method

.method public b(F)V
    .registers 4

    .line 5
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->o:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_d

    .line 6
    iput p1, v0, Lc/a/a/a/l0/h$c;->o:F

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->E()V

    :cond_d
    return-void
.end method

.method public b(I)V
    .registers 3

    .line 8
    iget-object v0, p0, Lc/a/a/a/l0/h;->w:Lc/a/a/a/k0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/k0/a;->a(I)V

    .line 9
    iget-object p1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lc/a/a/a/l0/h$c;->u:Z

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v1, v0, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_f

    .line 3
    iput-object p1, v0, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->onStateChange([I)Z

    :cond_f
    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .registers 8

    .line 11
    iget-object v2, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    iget-object v3, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v4, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lc/a/a/a/l0/m;Landroid/graphics/RectF;)V

    return-void
.end method

.method public final b(Landroid/graphics/RectF;Landroid/graphics/Path;)V
    .registers 9

    .line 12
    iget-object v0, p0, Lc/a/a/a/l0/h;->y:Lc/a/a/a/l0/n;

    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v2, v1, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    iget v3, v1, Lc/a/a/a/l0/h$c;->k:F

    iget-object v4, p0, Lc/a/a/a/l0/h;->x:Lc/a/a/a/l0/n$b;

    move-object v1, v2

    move v2, v3

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lc/a/a/a/l0/n;->a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Lc/a/a/a/l0/n$b;Landroid/graphics/Path;)V

    return-void
.end method

.method public c()F
    .registers 3

    .line 12
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    .line 13
    invoke-virtual {v0}, Lc/a/a/a/l0/m;->c()Lc/a/a/a/l0/c;

    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public c(F)V
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->k:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_10

    .line 3
    iput p1, v0, Lc/a/a/a/l0/h$c;->k:F

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lc/a/a/a/l0/h;->l:Z

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_10
    return-void
.end method

.method public c(I)V
    .registers 4

    .line 6
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->t:I

    if-eq v1, p1, :cond_b

    .line 7
    iput p1, v0, Lc/a/a/a/l0/h$c;->t:I

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    :cond_b
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .registers 8

    .line 9
    iget-object v2, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    iget-object v3, p0, Lc/a/a/a/l0/h;->o:Landroid/graphics/Path;

    iget-object v4, p0, Lc/a/a/a/l0/h;->t:Lc/a/a/a/l0/m;

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->f()Landroid/graphics/RectF;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    .line 11
    invoke-virtual/range {v0 .. v5}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lc/a/a/a/l0/m;Landroid/graphics/RectF;)V

    return-void
.end method

.method public d()F
    .registers 3

    .line 28
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    .line 29
    invoke-virtual {v0}, Lc/a/a/a/l0/m;->e()Lc/a/a/a/l0/c;

    move-result-object v0

    .line 30
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public d(F)V
    .registers 4

    .line 4
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->n:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_d

    .line 5
    iput p1, v0, Lc/a/a/a/l0/h$c;->n:F

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->E()V

    :cond_d
    return-void
.end method

.method public d(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->q:I

    if-eq v1, p1, :cond_b

    .line 2
    iput p1, v0, Lc/a/a/a/l0/h$c;->q:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    :cond_b
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;)V
    .registers 8

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->w()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 8
    :cond_7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 9
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->e(Landroid/graphics/Canvas;)V

    .line 10
    iget-boolean v0, p0, Lc/a/a/a/l0/h;->C:Z

    if-nez v0, :cond_18

    .line 11
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;)V

    .line 12
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    .line 13
    :cond_18
    iget-object v0, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    .line 14
    iget-object v1, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v1, v1

    if-ltz v0, :cond_94

    if-ltz v1, :cond_94

    .line 15
    iget-object v2, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    .line 16
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v3, v3, Lc/a/a/a/l0/h$c;->r:I

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    add-int/2addr v2, v0

    iget-object v3, p0, Lc/a/a/a/l0/h;->B:Landroid/graphics/RectF;

    .line 17
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v4, v4, Lc/a/a/a/l0/h$c;->r:I

    mul-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    add-int/2addr v3, v1

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 18
    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 19
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v5, v5, Lc/a/a/a/l0/h$c;->r:I

    sub-int/2addr v4, v5

    sub-int/2addr v4, v0

    int-to-float v0, v4

    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v5, v5, Lc/a/a/a/l0/h$c;->r:I

    sub-int/2addr v4, v5

    sub-int/2addr v4, v1

    int-to-float v1, v4

    neg-float v4, v0

    neg-float v5, v1

    .line 22
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 23
    invoke-virtual {p0, v3}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;)V

    const/4 v3, 0x0

    .line 24
    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 25
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 26
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    .line 27
    :cond_94
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Invalid shadow bounds. Check that the treatments result in a valid path."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    iget-object v1, p0, Lc/a/a/a/l0/h;->z:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    .line 3
    iget-object v1, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v2, v2, Lc/a/a/a/l0/h$c;->m:I

    invoke-static {v0, v2}, Lc/a/a/a/l0/h;->a(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    iget-object v1, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    iget-object v2, p0, Lc/a/a/a/l0/h;->A:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 5
    iget-object v1, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    iget-object v2, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v2, v2, Lc/a/a/a/l0/h$c;->l:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 6
    iget-object v1, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    .line 7
    iget-object v2, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v3, v3, Lc/a/a/a/l0/h$c;->m:I

    invoke-static {v1, v3}, Lc/a/a/a/l0/h;->a(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 8
    iget-boolean v2, p0, Lc/a/a/a/l0/h;->l:Z

    if-eqz v2, :cond_50

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->b()V

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v2

    iget-object v3, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {p0, v2, v3}, Lc/a/a/a/l0/h;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    const/4 v2, 0x0

    .line 11
    iput-boolean v2, p0, Lc/a/a/a/l0/h;->l:Z

    .line 12
    :cond_50
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->d(Landroid/graphics/Canvas;)V

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->x()Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 14
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->b(Landroid/graphics/Canvas;)V

    .line 15
    :cond_5c
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->y()Z

    move-result v2

    if-eqz v2, :cond_65

    .line 16
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->c(Landroid/graphics/Canvas;)V

    .line 17
    :cond_65
    iget-object p1, p0, Lc/a/a/a/l0/h;->u:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 18
    iget-object p1, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public e()Landroid/graphics/RectF;
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/l0/h;->p:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/l0/h;->p:Landroid/graphics/RectF;

    return-object v0
.end method

.method public e(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iput p1, v0, Lc/a/a/a/l0/h$c;->l:F

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public final e(Landroid/graphics/Canvas;)V
    .registers 7

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->k()I

    move-result v0

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->l()I

    move-result v1

    .line 7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_27

    iget-boolean v2, p0, Lc/a/a/a/l0/h;->C:Z

    if-eqz v2, :cond_27

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 9
    iget-object v3, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v3, v3, Lc/a/a/a/l0/h$c;->r:I

    neg-int v4, v3

    neg-int v3, v3

    invoke-virtual {v2, v4, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 10
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 11
    sget-object v3, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    :cond_27
    int-to-float v0, v0

    int-to-float v1, v1

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    return-void
.end method

.method public final f()Landroid/graphics/RectF;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->q:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->p()F

    move-result v0

    .line 3
    iget-object v1, p0, Lc/a/a/a/l0/h;->q:Landroid/graphics/RectF;

    invoke-virtual {v1, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/l0/h;->q:Landroid/graphics/RectF;

    return-object v0
.end method

.method public g()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->o:F

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    return-object v0
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public getOutline(Landroid/graphics/Outline;)V
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->q:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_8

    return-void

    .line 2
    :cond_8
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->B()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->s()F

    move-result v0

    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v1, Lc/a/a/a/l0/h$c;->k:F

    mul-float v0, v0, v1

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    return-void

    .line 5
    :cond_20
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {p0, v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->isConvex()Z

    move-result v0

    if-nez v0, :cond_37

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_3c

    .line 7
    :cond_37
    :try_start_37
    iget-object v0, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V
    :try_end_3c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_3c} :catch_3c

    :catch_3c
    :cond_3c
    return-void
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->i:Landroid/graphics/Rect;

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    const/4 p1, 0x1

    return p1

    .line 3
    :cond_b
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public getTransparentRegion()Landroid/graphics/Region;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/l0/h;->r:Landroid/graphics/Region;

    invoke-virtual {v1, v0}, Landroid/graphics/Region;->set(Landroid/graphics/Rect;)Z

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    invoke-virtual {p0, v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/l0/h;->s:Landroid/graphics/Region;

    iget-object v1, p0, Lc/a/a/a/l0/h;->n:Landroid/graphics/Path;

    iget-object v2, p0, Lc/a/a/a/l0/h;->r:Landroid/graphics/Region;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    .line 5
    iget-object v0, p0, Lc/a/a/a/l0/h;->r:Landroid/graphics/Region;

    iget-object v1, p0, Lc/a/a/a/l0/h;->s:Landroid/graphics/Region;

    sget-object v2, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Region;->op(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z

    .line 6
    iget-object v0, p0, Lc/a/a/a/l0/h;->r:Landroid/graphics/Region;

    return-object v0
.end method

.method public h()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public i()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->k:F

    return v0
.end method

.method public invalidateSelf()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lc/a/a/a/l0/h;->l:Z

    .line 2
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public isStateful()Z
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-nez v0, :cond_39

    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->g:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_12

    .line 2
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_39

    :cond_12
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->f:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1e

    .line 3
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_39

    :cond_1e
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_2a

    .line 4
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_39

    :cond_2a
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->d:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_37

    .line 5
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_37

    goto :goto_39

    :cond_37
    const/4 v0, 0x0

    goto :goto_3a

    :cond_39
    :goto_39
    const/4 v0, 0x1

    :goto_3a
    return v0
.end method

.method public j()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->n:F

    return v0
.end method

.method public k()I
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->s:I

    int-to-double v1, v1

    iget v0, v0, Lc/a/a/a/l0/h$c;->t:I

    int-to-double v3, v0

    .line 2
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    mul-double v1, v1, v3

    double-to-int v0, v1

    return v0
.end method

.method public l()I
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->s:I

    int-to-double v1, v1

    iget v0, v0, Lc/a/a/a/l0/h$c;->t:I

    int-to-double v3, v0

    .line 2
    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    mul-double v1, v1, v3

    double-to-int v0, v1

    return v0
.end method

.method public m()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->r:I

    return v0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/l0/h$c;

    iget-object v1, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    invoke-direct {v0, v1}, Lc/a/a/a/l0/h$c;-><init>(Lc/a/a/a/l0/h$c;)V

    .line 2
    iput-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    return-object p0
.end method

.method public n()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    return-object v0
.end method

.method public o()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->e:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lc/a/a/a/l0/h;->l:Z

    .line 2
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onStateChange([I)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a([I)Z

    move-result p1

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->D()Z

    move-result v0

    if-nez p1, :cond_f

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p1, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p1, 0x1

    :goto_10
    if-eqz p1, :cond_15

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_15
    return p1
.end method

.method public final p()F
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->y()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    return v0

    :cond_10
    const/4 v0, 0x0

    return v0
.end method

.method public q()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->l:F

    return v0
.end method

.method public r()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->g:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public s()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/l0/m;->j()Lc/a/a/a/l0/c;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public setAlpha(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->m:I

    if-eq v1, p1, :cond_b

    .line 2
    iput p1, v0, Lc/a/a/a/l0/h$c;->m:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    :cond_b
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iput-object p1, v0, Lc/a/a/a/l0/h$c;->c:Landroid/graphics/ColorFilter;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    return-void
.end method

.method public setShapeAppearanceModel(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iput-object p1, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public setTint(I)V
    .registers 2

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iput-object p1, v0, Lc/a/a/a/l0/h$c;->g:Landroid/content/res/ColorStateList;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->D()Z

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v1, v0, Lc/a/a/a/l0/h$c;->h:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_e

    .line 2
    iput-object p1, v0, Lc/a/a/a/l0/h$c;->h:Landroid/graphics/PorterDuff$Mode;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->D()Z

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->z()V

    :cond_e
    return-void
.end method

.method public t()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->a:Lc/a/a/a/l0/m;

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/l0/m;->l()Lc/a/a/a/l0/c;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public u()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v0, v0, Lc/a/a/a/l0/h$c;->p:F

    return v0
.end method

.method public v()F
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->g()F

    move-result v0

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->u()F

    move-result v1

    add-float/2addr v0, v1

    return v0
.end method

.method public final w()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget v1, v0, Lc/a/a/a/l0/h$c;->q:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_15

    iget v0, v0, Lc/a/a/a/l0/h$c;->r:I

    if-lez v0, :cond_15

    const/4 v0, 0x2

    if-eq v1, v0, :cond_16

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->C()Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_16

    :cond_15
    const/4 v2, 0x0

    :cond_16
    :goto_16
    return v2
.end method

.method public final x()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->v:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v0, v1, :cond_f

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public final y()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h;->h:Lc/a/a/a/l0/h$c;

    iget-object v0, v0, Lc/a/a/a/l0/h$c;->v:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v0, v1, :cond_c

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_19

    :cond_c
    iget-object v0, p0, Lc/a/a/a/l0/h;->v:Landroid/graphics/Paint;

    .line 2
    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_19

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return v0
.end method

.method public final z()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
