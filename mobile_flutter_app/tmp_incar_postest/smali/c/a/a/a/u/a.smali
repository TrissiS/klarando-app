.class public Lc/a/a/a/u/a;
.super Lc/a/a/a/l0/h;
.source "ChipDrawable.java"

# interfaces
.implements Lb/h/f/l/b;
.implements Landroid/graphics/drawable/Drawable$Callback;
.implements Lc/a/a/a/d0/j$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/u/a$a;
    }
.end annotation


# static fields
.field public static final P0:[I

.field public static final Q0:Landroid/graphics/drawable/ShapeDrawable;


# instance fields
.field public A0:Z

.field public B0:I

.field public C0:I

.field public D0:Landroid/graphics/ColorFilter;

.field public E0:Landroid/graphics/PorterDuffColorFilter;

.field public F:Landroid/content/res/ColorStateList;

.field public F0:Landroid/content/res/ColorStateList;

.field public G:Landroid/content/res/ColorStateList;

.field public G0:Landroid/graphics/PorterDuff$Mode;

.field public H:F

.field public H0:[I

.field public I:F

.field public I0:Z

.field public J:Landroid/content/res/ColorStateList;

.field public J0:Landroid/content/res/ColorStateList;

.field public K:F

.field public K0:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lc/a/a/a/u/a$a;",
            ">;"
        }
    .end annotation
.end field

.field public L:Landroid/content/res/ColorStateList;

.field public L0:Landroid/text/TextUtils$TruncateAt;

.field public M:Ljava/lang/CharSequence;

.field public M0:Z

.field public N:Z

.field public N0:I

.field public O:Landroid/graphics/drawable/Drawable;

.field public O0:Z

.field public P:Landroid/content/res/ColorStateList;

.field public Q:F

.field public R:Z

.field public S:Z

.field public T:Landroid/graphics/drawable/Drawable;

.field public U:Landroid/graphics/drawable/Drawable;

.field public V:Landroid/content/res/ColorStateList;

.field public W:F

.field public X:Ljava/lang/CharSequence;

.field public Y:Z

.field public Z:Z

.field public a0:Landroid/graphics/drawable/Drawable;

.field public b0:Landroid/content/res/ColorStateList;

.field public c0:Lc/a/a/a/m/h;

.field public d0:Lc/a/a/a/m/h;

.field public e0:F

.field public f0:F

.field public g0:F

.field public h0:F

.field public i0:F

.field public j0:F

.field public k0:F

.field public l0:F

.field public final m0:Landroid/content/Context;

.field public final n0:Landroid/graphics/Paint;

.field public final o0:Landroid/graphics/Paint;

.field public final p0:Landroid/graphics/Paint$FontMetrics;

.field public final q0:Landroid/graphics/RectF;

.field public final r0:Landroid/graphics/PointF;

.field public final s0:Landroid/graphics/Path;

.field public final t0:Lc/a/a/a/d0/j;

.field public u0:I

.field public v0:I

.field public w0:I

.field public x0:I

.field public y0:I

.field public z0:I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101009e

    aput v2, v0, v1

    .line 1
    sput-object v0, Lc/a/a/a/u/a;->P0:[I

    .line 2
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    sput-object v0, Lc/a/a/a/u/a;->Q0:Landroid/graphics/drawable/ShapeDrawable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lc/a/a/a/l0/h;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/high16 p2, -0x40800000    # -1.0f

    .line 2
    iput p2, p0, Lc/a/a/a/u/a;->I:F

    .line 3
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    .line 4
    new-instance p2, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {p2}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object p2, p0, Lc/a/a/a/u/a;->p0:Landroid/graphics/Paint$FontMetrics;

    .line 5
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    .line 6
    new-instance p2, Landroid/graphics/PointF;

    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    iput-object p2, p0, Lc/a/a/a/u/a;->r0:Landroid/graphics/PointF;

    .line 7
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    iput-object p2, p0, Lc/a/a/a/u/a;->s0:Landroid/graphics/Path;

    const/16 p2, 0xff

    .line 8
    iput p2, p0, Lc/a/a/a/u/a;->C0:I

    .line 9
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object p2, p0, Lc/a/a/a/u/a;->G0:Landroid/graphics/PorterDuff$Mode;

    .line 10
    new-instance p2, Ljava/lang/ref/WeakReference;

    const/4 p4, 0x0

    invoke-direct {p2, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lc/a/a/a/u/a;->K0:Ljava/lang/ref/WeakReference;

    .line 11
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    .line 12
    iput-object p1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    .line 13
    new-instance p2, Lc/a/a/a/d0/j;

    invoke-direct {p2, p0}, Lc/a/a/a/d0/j;-><init>(Lc/a/a/a/d0/j$b;)V

    iput-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    const-string v0, ""

    .line 14
    iput-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    .line 15
    invoke-virtual {p2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    iput p1, p2, Landroid/text/TextPaint;->density:F

    .line 16
    iput-object p4, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    if-eqz p4, :cond_64

    .line 17
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p4, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 18
    :cond_64
    sget-object p1, Lc/a/a/a/u/a;->P0:[I

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 19
    sget-object p1, Lc/a/a/a/u/a;->P0:[I

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b([I)Z

    .line 20
    iput-boolean p3, p0, Lc/a/a/a/u/a;->M0:Z

    .line 21
    sget-boolean p1, Lc/a/a/a/j0/b;->a:Z

    if-eqz p1, :cond_7a

    .line 22
    sget-object p1, Lc/a/a/a/u/a;->Q0:Landroid/graphics/drawable/ShapeDrawable;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/ShapeDrawable;->setTint(I)V

    :cond_7a
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/u/a;
    .registers 5

    .line 1
    new-instance v0, Lc/a/a/a/u/a;

    invoke-direct {v0, p0, p1, p2, p3}, Lc/a/a/a/u/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    invoke-virtual {v0, p1, p2, p3}, Lc/a/a/a/u/a;->a(Landroid/util/AttributeSet;II)V

    return-object v0
.end method

.method public static a([II)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 172
    :cond_4
    array-length v1, p0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_11

    aget v3, p0, v2

    if-ne v3, p1, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_11
    return v0
.end method

.method public static b(Lc/a/a/a/i0/d;)Z
    .registers 1

    if-eqz p0, :cond_e

    .line 17
    iget-object p0, p0, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    if-eqz p0, :cond_e

    .line 18
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    return p0
.end method

.method public static f(Landroid/graphics/drawable/Drawable;)Z
    .registers 1

    if-eqz p0, :cond_a

    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static j(Landroid/content/res/ColorStateList;)Z
    .registers 1

    if-eqz p0, :cond_a

    .line 1
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method


# virtual methods
.method public A(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->p(F)V

    return-void
.end method

.method public B(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/u/a;->N0:I

    return-void
.end method

.method public C(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->i(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public D(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public E(I)V
    .registers 4

    .line 1
    new-instance v0, Lc/a/a/a/i0/d;

    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lc/a/a/a/i0/d;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p0, v0}, Lc/a/a/a/u/a;->a(Lc/a/a/a/i0/d;)V

    return-void
.end method

.method public F()F
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    return v0

    .line 2
    :cond_f
    :goto_f
    iget v0, p0, Lc/a/a/a/u/a;->f0:F

    invoke-virtual {p0}, Lc/a/a/a/u/a;->d0()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->g0:F

    add-float/2addr v0, v1

    return v0
.end method

.method public F(I)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->q(F)V

    return-void
.end method

.method public G()F
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->j0:F

    iget v1, p0, Lc/a/a/a/u/a;->W:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->k0:F

    add-float/2addr v0, v1

    return v0

    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public G(I)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->r(F)V

    return-void
.end method

.method public final H()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/u/a;->p0:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->p0:Landroid/graphics/Paint$FontMetrics;

    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    add-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v1, v0

    return v1
.end method

.method public final I()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->Z:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Lc/a/a/a/u/a;->Y:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public J()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public K()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->b0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public L()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->G:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public M()F
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->s()F

    move-result v0

    goto :goto_b

    :cond_9
    iget v0, p0, Lc/a/a/a/u/a;->I:F

    :goto_b
    return v0
.end method

.method public N()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->l0:F

    return v0
.end method

.method public O()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    invoke-static {v0}, Lb/h/f/l/a;->h(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public P()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->Q:F

    return v0
.end method

.method public Q()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->P:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public R()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->H:F

    return v0
.end method

.method public S()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    return v0
.end method

.method public T()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->J:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public U()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->K:F

    return v0
.end method

.method public V()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    invoke-static {v0}, Lb/h/f/l/a;->h(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public W()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->X:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public X()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->k0:F

    return v0
.end method

.method public Y()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->W:F

    return v0
.end method

.method public Z()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->j0:F

    return v0
.end method

.method public a(Landroid/graphics/Rect;Landroid/graphics/PointF;)Landroid/graphics/Paint$Align;
    .registers 5

    const/4 v0, 0x0

    .line 93
    invoke-virtual {p2, v0, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 94
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 95
    iget-object v1, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    if-eqz v1, :cond_37

    .line 96
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->h0:F

    add-float/2addr v0, v1

    .line 97
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_23

    .line 98
    iget v1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 99
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    goto :goto_2b

    .line 100
    :cond_23
    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 101
    sget-object v0, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    .line 102
    :goto_2b
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lc/a/a/a/u/a;->H()F

    move-result v1

    sub-float/2addr p1, v1

    iput p1, p2, Landroid/graphics/PointF;->y:F

    :cond_37
    return-object v0
.end method

.method public a()V
    .registers 1

    .line 103
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    .line 104
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 8

    .line 73
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 74
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 75
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 76
    iget p2, p2, Landroid/graphics/RectF;->top:F

    .line 77
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 78
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 79
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-float v0, v0

    neg-float p2, p2

    .line 80
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_32
    return-void
.end method

.method public final a(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .registers 6

    .line 81
    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    .line 82
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 83
    :cond_f
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    iget v1, p0, Lc/a/a/a/u/a;->f0:F

    add-float/2addr v0, v1

    .line 84
    invoke-virtual {p0}, Lc/a/a/a/u/a;->d0()F

    move-result v1

    .line 85
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v2

    if-nez v2, :cond_28

    .line 86
    iget v2, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v0

    iput v2, p2, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v1

    .line 87
    iput v2, p2, Landroid/graphics/RectF;->right:F

    goto :goto_31

    .line 88
    :cond_28
    iget v2, p1, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    sub-float/2addr v2, v0

    iput v2, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v1

    .line 89
    iput v2, p2, Landroid/graphics/RectF;->left:F

    .line 90
    :goto_31
    invoke-virtual {p0}, Lc/a/a/a/u/a;->c0()F

    move-result v0

    .line 91
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v0, v1

    sub-float/2addr p1, v1

    iput p1, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v0

    .line 92
    iput p1, p2, Landroid/graphics/RectF;->bottom:F

    :cond_43
    return-void
.end method

.method public a(Landroid/graphics/RectF;)V
    .registers 3

    .line 72
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lc/a/a/a/u/a;->d(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    if-nez p1, :cond_3

    return-void

    .line 160
    :cond_3
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 161
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 162
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 163
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 164
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_33

    .line 165
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 166
    invoke-virtual {p0}, Lc/a/a/a/u/a;->a0()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 167
    :cond_2d
    iget-object v0, p0, Lc/a/a/a/u/a;->V:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void

    .line 168
    :cond_33
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 169
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 170
    :cond_40
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_4d

    iget-boolean p1, p0, Lc/a/a/a/u/a;->R:Z

    if-eqz p1, :cond_4d

    .line 171
    iget-object p1, p0, Lc/a/a/a/u/a;->P:Landroid/content/res/ColorStateList;

    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_4d
    return-void
.end method

.method public a(Landroid/text/TextUtils$TruncateAt;)V
    .registers 2

    .line 174
    iput-object p1, p0, Lc/a/a/a/u/a;->L0:Landroid/text/TextUtils$TruncateAt;

    return-void
.end method

.method public final a(Landroid/util/AttributeSet;II)V
    .registers 11

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget-object v2, Lc/a/a/a/l;->Chip:[I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v1, p1

    move v3, p2

    move v4, p3

    .line 4
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 5
    sget p3, Lc/a/a/a/l;->Chip_shapeAppearance:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    iput-boolean p3, p0, Lc/a/a/a/u/a;->O0:Z

    .line 6
    iget-object p3, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v0, Lc/a/a/a/l;->Chip_chipSurfaceColor:I

    .line 7
    invoke-static {p3, p2, v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    .line 8
    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->g(Landroid/content/res/ColorStateList;)V

    .line 9
    iget-object p3, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v0, Lc/a/a/a/l;->Chip_chipBackgroundColor:I

    .line 10
    invoke-static {p3, p2, v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    .line 11
    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->d(Landroid/content/res/ColorStateList;)V

    .line 12
    sget p3, Lc/a/a/a/l;->Chip_chipMinHeight:I

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->i(F)V

    .line 13
    sget p3, Lc/a/a/a/l;->Chip_chipCornerRadius:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_47

    .line 14
    sget p3, Lc/a/a/a/l;->Chip_chipCornerRadius:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->f(F)V

    .line 15
    :cond_47
    iget-object p3, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v1, Lc/a/a/a/l;->Chip_chipStrokeColor:I

    .line 16
    invoke-static {p3, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    .line 17
    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->f(Landroid/content/res/ColorStateList;)V

    .line 18
    sget p3, Lc/a/a/a/l;->Chip_chipStrokeWidth:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->k(F)V

    .line 19
    iget-object p3, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v1, Lc/a/a/a/l;->Chip_rippleColor:I

    invoke-static {p3, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->i(Landroid/content/res/ColorStateList;)V

    .line 20
    sget p3, Lc/a/a/a/l;->Chip_android_text:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->b(Ljava/lang/CharSequence;)V

    .line 21
    iget-object p3, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v1, Lc/a/a/a/l;->Chip_android_textAppearance:I

    .line 22
    invoke-static {p3, p2, v1}, Lc/a/a/a/i0/c;->c(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/i0/d;

    move-result-object p3

    .line 23
    sget v1, Lc/a/a/a/l;->Chip_android_textSize:I

    iget v2, p3, Lc/a/a/a/i0/d;->k:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 24
    iput v1, p3, Lc/a/a/a/i0/d;->k:F

    .line 25
    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->a(Lc/a/a/a/i0/d;)V

    .line 26
    sget p3, Lc/a/a/a/l;->Chip_android_ellipsize:I

    invoke-virtual {p2, p3, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    const/4 v1, 0x1

    if-eq p3, v1, :cond_a0

    const/4 v1, 0x2

    if-eq p3, v1, :cond_9a

    const/4 v1, 0x3

    if-eq p3, v1, :cond_94

    goto :goto_a5

    .line 27
    :cond_94
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->a(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_a5

    .line 28
    :cond_9a
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->a(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_a5

    .line 29
    :cond_a0
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->a(Landroid/text/TextUtils$TruncateAt;)V

    .line 30
    :goto_a5
    sget p3, Lc/a/a/a/l;->Chip_chipIconVisible:I

    invoke-virtual {p2, p3, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    invoke-virtual {p0, p3}, Lc/a/a/a/u/a;->d(Z)V

    const-string p3, "http://schemas.android.com/apk/res-auto"

    if-eqz p1, :cond_cb

    const-string v1, "chipIconEnabled"

    .line 31
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_cb

    const-string v1, "chipIconVisible"

    .line 32
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_cb

    .line 33
    sget v1, Lc/a/a/a/l;->Chip_chipIconEnabled:I

    invoke-virtual {p2, v1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->d(Z)V

    .line 34
    :cond_cb
    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v2, Lc/a/a/a/l;->Chip_chipIcon:I

    invoke-static {v1, p2, v2}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->c(Landroid/graphics/drawable/Drawable;)V

    .line 35
    sget v1, Lc/a/a/a/l;->Chip_chipIconTint:I

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_e9

    .line 36
    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v2, Lc/a/a/a/l;->Chip_chipIconTint:I

    .line 37
    invoke-static {v1, p2, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->e(Landroid/content/res/ColorStateList;)V

    .line 39
    :cond_e9
    sget v1, Lc/a/a/a/l;->Chip_chipIconSize:I

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->h(F)V

    .line 40
    sget v1, Lc/a/a/a/l;->Chip_closeIconVisible:I

    invoke-virtual {p2, v1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->e(Z)V

    if-eqz p1, :cond_118

    const-string v1, "closeIconEnabled"

    .line 41
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_118

    const-string v1, "closeIconVisible"

    .line 42
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_118

    .line 43
    sget v1, Lc/a/a/a/l;->Chip_closeIconEnabled:I

    invoke-virtual {p2, v1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->e(Z)V

    .line 44
    :cond_118
    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v2, Lc/a/a/a/l;->Chip_closeIcon:I

    invoke-static {v1, p2, v2}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->d(Landroid/graphics/drawable/Drawable;)V

    .line 45
    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget v2, Lc/a/a/a/l;->Chip_closeIconTint:I

    .line 46
    invoke-static {v1, p2, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 47
    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->h(Landroid/content/res/ColorStateList;)V

    .line 48
    sget v1, Lc/a/a/a/l;->Chip_closeIconSize:I

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->m(F)V

    .line 49
    sget v1, Lc/a/a/a/l;->Chip_android_checkable:I

    invoke-virtual {p2, v1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->b(Z)V

    .line 50
    sget v1, Lc/a/a/a/l;->Chip_checkedIconVisible:I

    invoke-virtual {p2, v1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->c(Z)V

    if-eqz p1, :cond_164

    const-string v1, "checkedIconEnabled"

    .line 51
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_164

    const-string v1, "checkedIconVisible"

    .line 52
    invoke-interface {p1, p3, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_164

    .line 53
    sget p1, Lc/a/a/a/l;->Chip_checkedIconEnabled:I

    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->c(Z)V

    .line 54
    :cond_164
    iget-object p1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget p3, Lc/a/a/a/l;->Chip_checkedIcon:I

    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->b(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b(Landroid/graphics/drawable/Drawable;)V

    .line 55
    sget p1, Lc/a/a/a/l;->Chip_checkedIconTint:I

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_182

    .line 56
    iget-object p1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget p3, Lc/a/a/a/l;->Chip_checkedIconTint:I

    .line 57
    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->c(Landroid/content/res/ColorStateList;)V

    .line 59
    :cond_182
    iget-object p1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget p3, Lc/a/a/a/l;->Chip_showMotionSpec:I

    invoke-static {p1, p2, p3}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b(Lc/a/a/a/m/h;)V

    .line 60
    iget-object p1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    sget p3, Lc/a/a/a/l;->Chip_hideMotionSpec:I

    invoke-static {p1, p2, p3}, Lc/a/a/a/m/h;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->a(Lc/a/a/a/m/h;)V

    .line 61
    sget p1, Lc/a/a/a/l;->Chip_chipStartPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->j(F)V

    .line 62
    sget p1, Lc/a/a/a/l;->Chip_iconStartPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->p(F)V

    .line 63
    sget p1, Lc/a/a/a/l;->Chip_iconEndPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->o(F)V

    .line 64
    sget p1, Lc/a/a/a/l;->Chip_textStartPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->r(F)V

    .line 65
    sget p1, Lc/a/a/a/l;->Chip_textEndPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->q(F)V

    .line 66
    sget p1, Lc/a/a/a/l;->Chip_closeIconStartPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->n(F)V

    .line 67
    sget p1, Lc/a/a/a/l;->Chip_closeIconEndPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->l(F)V

    .line 68
    sget p1, Lc/a/a/a/l;->Chip_chipEndPadding:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->g(F)V

    .line 69
    sget p1, Lc/a/a/a/l;->Chip_android_maxWidth:I

    const p3, 0x7fffffff

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->B(I)V

    .line 70
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public a(Lc/a/a/a/i0/d;)V
    .registers 4

    .line 173
    iget-object v0, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/i0/d;Landroid/content/Context;)V

    return-void
.end method

.method public a(Lc/a/a/a/m/h;)V
    .registers 2

    .line 178
    iput-object p1, p0, Lc/a/a/a/u/a;->d0:Lc/a/a/a/m/h;

    return-void
.end method

.method public a(Lc/a/a/a/u/a$a;)V
    .registers 3

    .line 71
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc/a/a/a/u/a;->K0:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 175
    iget-object v0, p0, Lc/a/a/a/u/a;->X:Ljava/lang/CharSequence;

    if-eq v0, p1, :cond_11

    .line 176
    invoke-static {}, Lb/h/k/a;->b()Lb/h/k/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lb/h/k/a;->a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/u/a;->X:Ljava/lang/CharSequence;

    .line 177
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_11
    return-void
.end method

.method public final a([I[I)Z
    .registers 9

    .line 105
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->onStateChange([I)Z

    move-result v0

    .line 106
    iget-object v1, p0, Lc/a/a/a/u/a;->F:Landroid/content/res/ColorStateList;

    const/4 v2, 0x0

    if-eqz v1, :cond_10

    iget v3, p0, Lc/a/a/a/u/a;->u0:I

    .line 107
    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_11

    :cond_10
    const/4 v1, 0x0

    .line 108
    :goto_11
    invoke-virtual {p0, v1}, Lc/a/a/a/l0/h;->a(I)I

    move-result v1

    .line 109
    iget v3, p0, Lc/a/a/a/u/a;->u0:I

    const/4 v4, 0x1

    if-eq v3, v1, :cond_1d

    .line 110
    iput v1, p0, Lc/a/a/a/u/a;->u0:I

    const/4 v0, 0x1

    .line 111
    :cond_1d
    iget-object v3, p0, Lc/a/a/a/u/a;->G:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_28

    iget v5, p0, Lc/a/a/a/u/a;->v0:I

    .line 112
    invoke-virtual {v3, p1, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    goto :goto_29

    :cond_28
    const/4 v3, 0x0

    .line 113
    :goto_29
    invoke-virtual {p0, v3}, Lc/a/a/a/l0/h;->a(I)I

    move-result v3

    .line 114
    iget v5, p0, Lc/a/a/a/u/a;->v0:I

    if-eq v5, v3, :cond_34

    .line 115
    iput v3, p0, Lc/a/a/a/u/a;->v0:I

    const/4 v0, 0x1

    .line 116
    :cond_34
    invoke-static {v1, v3}, Lc/a/a/a/w/a;->b(II)I

    move-result v1

    .line 117
    iget v3, p0, Lc/a/a/a/u/a;->w0:I

    if-eq v3, v1, :cond_3e

    const/4 v3, 0x1

    goto :goto_3f

    :cond_3e
    const/4 v3, 0x0

    .line 118
    :goto_3f
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->h()Landroid/content/res/ColorStateList;

    move-result-object v5

    if-nez v5, :cond_47

    const/4 v5, 0x1

    goto :goto_48

    :cond_47
    const/4 v5, 0x0

    :goto_48
    or-int/2addr v3, v5

    if-eqz v3, :cond_55

    .line 119
    iput v1, p0, Lc/a/a/a/u/a;->w0:I

    .line 120
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    const/4 v0, 0x1

    .line 121
    :cond_55
    iget-object v1, p0, Lc/a/a/a/u/a;->J:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_60

    iget v3, p0, Lc/a/a/a/u/a;->x0:I

    .line 122
    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_61

    :cond_60
    const/4 v1, 0x0

    .line 123
    :goto_61
    iget v3, p0, Lc/a/a/a/u/a;->x0:I

    if-eq v3, v1, :cond_68

    .line 124
    iput v1, p0, Lc/a/a/a/u/a;->x0:I

    const/4 v0, 0x1

    .line 125
    :cond_68
    iget-object v1, p0, Lc/a/a/a/u/a;->J0:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_7b

    .line 126
    invoke-static {p1}, Lc/a/a/a/j0/b;->a([I)Z

    move-result v1

    if-eqz v1, :cond_7b

    iget-object v1, p0, Lc/a/a/a/u/a;->J0:Landroid/content/res/ColorStateList;

    iget v3, p0, Lc/a/a/a/u/a;->y0:I

    .line 127
    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_7c

    :cond_7b
    const/4 v1, 0x0

    .line 128
    :goto_7c
    iget v3, p0, Lc/a/a/a/u/a;->y0:I

    if-eq v3, v1, :cond_87

    .line 129
    iput v1, p0, Lc/a/a/a/u/a;->y0:I

    .line 130
    iget-boolean v1, p0, Lc/a/a/a/u/a;->I0:Z

    if-eqz v1, :cond_87

    const/4 v0, 0x1

    .line 131
    :cond_87
    iget-object v1, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 132
    invoke-virtual {v1}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v1

    if-eqz v1, :cond_a8

    iget-object v1, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 133
    invoke-virtual {v1}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v1

    iget-object v1, v1, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_a8

    iget-object v1, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 134
    invoke-virtual {v1}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v1

    iget-object v1, v1, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    iget v3, p0, Lc/a/a/a/u/a;->z0:I

    .line 135
    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_a9

    :cond_a8
    const/4 v1, 0x0

    .line 136
    :goto_a9
    iget v3, p0, Lc/a/a/a/u/a;->z0:I

    if-eq v3, v1, :cond_b0

    .line 137
    iput v1, p0, Lc/a/a/a/u/a;->z0:I

    const/4 v0, 0x1

    .line 138
    :cond_b0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    const v3, 0x10100a0

    invoke-static {v1, v3}, Lc/a/a/a/u/a;->a([II)Z

    move-result v1

    if-eqz v1, :cond_c3

    iget-boolean v1, p0, Lc/a/a/a/u/a;->Y:Z

    if-eqz v1, :cond_c3

    const/4 v1, 0x1

    goto :goto_c4

    :cond_c3
    const/4 v1, 0x0

    .line 139
    :goto_c4
    iget-boolean v3, p0, Lc/a/a/a/u/a;->A0:Z

    if-eq v3, v1, :cond_de

    iget-object v3, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_de

    .line 140
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    .line 141
    iput-boolean v1, p0, Lc/a/a/a/u/a;->A0:Z

    .line 142
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_dd

    const/4 v0, 0x1

    const/4 v1, 0x1

    goto :goto_df

    :cond_dd
    const/4 v0, 0x1

    :cond_de
    const/4 v1, 0x0

    .line 143
    :goto_df
    iget-object v3, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_ea

    iget v5, p0, Lc/a/a/a/u/a;->B0:I

    invoke-virtual {v3, p1, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    goto :goto_eb

    :cond_ea
    const/4 v3, 0x0

    .line 144
    :goto_eb
    iget v5, p0, Lc/a/a/a/u/a;->B0:I

    if-eq v5, v3, :cond_fc

    .line 145
    iput v3, p0, Lc/a/a/a/u/a;->B0:I

    .line 146
    iget-object v0, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    iget-object v3, p0, Lc/a/a/a/u/a;->G0:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p0, v0, v3}, Lc/a/a/a/z/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/u/a;->E0:Landroid/graphics/PorterDuffColorFilter;

    goto :goto_fd

    :cond_fc
    move v4, v0

    .line 147
    :goto_fd
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_10c

    .line 148
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v4, v0

    .line 149
    :cond_10c
    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_11b

    .line 150
    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v4, v0

    .line 151
    :cond_11b
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_138

    .line 152
    array-length v0, p1

    array-length v3, p2

    add-int/2addr v0, v3

    new-array v0, v0, [I

    .line 153
    array-length v3, p1

    invoke-static {p1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 154
    array-length p1, p1

    array-length v3, p2

    invoke-static {p2, v2, v0, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    iget-object p1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    or-int/2addr v4, p1

    .line 156
    :cond_138
    sget-boolean p1, Lc/a/a/a/j0/b;->a:Z

    if-eqz p1, :cond_14b

    iget-object p1, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_14b

    .line 157
    iget-object p1, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    or-int/2addr v4, p1

    :cond_14b
    if-eqz v4, :cond_150

    .line 158
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_150
    if-eqz v1, :cond_155

    .line 159
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_155
    return v4
.end method

.method public a0()[I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->H0:[I

    return-object v0
.end method

.method public final b(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 6

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-nez v0, :cond_2f

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    iget v1, p0, Lc/a/a/a/u/a;->v0:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lc/a/a/a/u/a;->o0()Landroid/graphics/ColorFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 5
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 6
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v0

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v1

    iget-object v2, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_2f
    return-void
.end method

.method public final b(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .registers 5

    .line 7
    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 9
    iget v0, p0, Lc/a/a/a/u/a;->l0:F

    iget v1, p0, Lc/a/a/a/u/a;->k0:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->W:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->j0:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->i0:F

    add-float/2addr v0, v1

    .line 10
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_24

    .line 11
    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    sub-float/2addr p1, v0

    iput p1, p2, Landroid/graphics/RectF;->right:F

    goto :goto_2a

    .line 12
    :cond_24
    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    add-float/2addr p1, v0

    iput p1, p2, Landroid/graphics/RectF;->left:F

    :cond_2a
    :goto_2a
    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 32
    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_22

    .line 33
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    .line 34
    iput-object p1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    .line 35
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 36
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 37
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 38
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_22

    .line 39
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_22
    return-void
.end method

.method public b(Lc/a/a/a/m/h;)V
    .registers 2

    .line 40
    iput-object p1, p0, Lc/a/a/a/u/a;->c0:Lc/a/a/a/m/h;

    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .registers 3

    if-nez p1, :cond_4

    const-string p1, ""

    .line 19
    :cond_4
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 20
    iput-object p1, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    .line 21
    iget-object p1, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/j;->a(Z)V

    .line 22
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 23
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_1a
    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 24
    iget-boolean v0, p0, Lc/a/a/a/u/a;->Y:Z

    if-eq v0, p1, :cond_21

    .line 25
    iput-boolean p1, p0, Lc/a/a/a/u/a;->Y:Z

    .line 26
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    if-nez p1, :cond_13

    .line 27
    iget-boolean p1, p0, Lc/a/a/a/u/a;->A0:Z

    if-eqz p1, :cond_13

    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lc/a/a/a/u/a;->A0:Z

    .line 29
    :cond_13
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 30
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_21

    .line 31
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_21
    return-void
.end method

.method public b([I)Z
    .registers 3

    .line 13
    iget-object v0, p0, Lc/a/a/a/u/a;->H0:[I

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_19

    .line 14
    iput-object p1, p0, Lc/a/a/a/u/a;->H0:[I

    .line 15
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 16
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lc/a/a/a/u/a;->a([I[I)Z

    move-result p1

    return p1

    :cond_19
    const/4 p1, 0x0

    return p1
.end method

.method public b0()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->V:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public c(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 36
    iget-object v0, p0, Lc/a/a/a/u/a;->b0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_18

    .line 37
    iput-object p1, p0, Lc/a/a/a/u/a;->b0:Landroid/content/res/ColorStateList;

    .line 38
    invoke-virtual {p0}, Lc/a/a/a/u/a;->I()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 39
    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 40
    :cond_11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_18
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 8

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 3
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 4
    iget p2, p2, Landroid/graphics/RectF;->top:F

    .line 5
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 6
    iget-object v1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    iget-object v1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-float v0, v0

    neg-float p2, p2

    .line 8
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_32
    return-void
.end method

.method public final c(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .registers 5

    .line 9
    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 11
    iget v0, p0, Lc/a/a/a/u/a;->l0:F

    iget v1, p0, Lc/a/a/a/u/a;->k0:F

    add-float/2addr v0, v1

    .line 12
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_20

    .line 13
    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->right:F

    .line 14
    iget v0, p0, Lc/a/a/a/u/a;->W:F

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->left:F

    goto :goto_2b

    .line 15
    :cond_20
    iget v1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->left:F

    .line 16
    iget v0, p0, Lc/a/a/a/u/a;->W:F

    add-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->right:F

    .line 17
    :goto_2b
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result p1

    iget v0, p0, Lc/a/a/a/u/a;->W:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v0, v1

    sub-float/2addr p1, v1

    iput p1, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v0

    .line 18
    iput p1, p2, Landroid/graphics/RectF;->bottom:F

    :cond_3b
    return-void
.end method

.method public c(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 19
    invoke-virtual {p0}, Lc/a/a/a/u/a;->O()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq v0, p1, :cond_34

    .line 20
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v1

    if-eqz p1, :cond_15

    .line 21
    invoke-static {p1}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    iput-object p1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    .line 22
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 23
    invoke-virtual {p0, v0}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 24
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 25
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 26
    :cond_2a
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v1, p1

    if-eqz p1, :cond_34

    .line 27
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_34
    return-void
.end method

.method public c(Z)V
    .registers 3

    .line 28
    iget-boolean v0, p0, Lc/a/a/a/u/a;->Z:Z

    if-eq v0, p1, :cond_28

    .line 29
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v0

    .line 30
    iput-boolean p1, p0, Lc/a/a/a/u/a;->Z:Z

    .line 31
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result p1

    if-eq v0, p1, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    if-eqz v0, :cond_28

    if-eqz p1, :cond_1d

    .line 32
    iget-object p1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22

    .line 33
    :cond_1d
    iget-object p1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 34
    :goto_22
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 35
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_28
    return-void
.end method

.method public final c0()F
    .registers 4

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->A0:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    goto :goto_9

    :cond_7
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    .line 2
    :goto_9
    iget v1, p0, Lc/a/a/a/u/a;->Q:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_30

    if-eqz v0, :cond_30

    .line 3
    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    const/16 v2, 0x18

    invoke-static {v1, v2}, Lc/a/a/a/d0/t;->a(Landroid/content/Context;I)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-float v1, v1

    .line 4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, v2, v1

    if-gtz v2, :cond_2f

    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    return v0

    :cond_2f
    return v1

    .line 6
    :cond_30
    iget v0, p0, Lc/a/a/a/u/a;->Q:F

    return v0
.end method

.method public d(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 19
    iget-object v0, p0, Lc/a/a/a/u/a;->G:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_d

    .line 20
    iput-object p1, p0, Lc/a/a/a/u/a;->G:Landroid/content/res/ColorStateList;

    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_d
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 10

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->K:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_53

    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-nez v0, :cond_53

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    iget v1, p0, Lc/a/a/a/u/a;->x0:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 4
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-nez v0, :cond_26

    .line 5
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lc/a/a/a/u/a;->o0()Landroid/graphics/ColorFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    :cond_26
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, p0, Lc/a/a/a/u/a;->K:F

    const/high16 v3, 0x40000000    # 2.0f

    div-float v4, v2, v3

    add-float/2addr v1, v4

    iget v4, p2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    div-float v5, v2, v3

    add-float/2addr v4, v5

    iget v5, p2, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    div-float v6, v2, v3

    sub-float/2addr v5, v6

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float p2, p2

    div-float/2addr v2, v3

    sub-float/2addr p2, v2

    invoke-virtual {v0, v1, v4, v5, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 7
    iget p2, p0, Lc/a/a/a/u/a;->I:F

    iget v0, p0, Lc/a/a/a/u/a;->K:F

    div-float/2addr v0, v3

    sub-float/2addr p2, v0

    .line 8
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p2, p2, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_53
    return-void
.end method

.method public final d(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .registers 6

    .line 9
    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    .line 10
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 11
    iget v0, p0, Lc/a/a/a/u/a;->l0:F

    iget v1, p0, Lc/a/a/a/u/a;->k0:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->W:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->j0:F

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->i0:F

    add-float/2addr v0, v1

    .line 12
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_26

    .line 13
    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    iput v1, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v0

    .line 14
    iput v1, p2, Landroid/graphics/RectF;->left:F

    goto :goto_2f

    .line 15
    :cond_26
    iget v1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v1

    iput v2, p2, Landroid/graphics/RectF;->left:F

    int-to-float v1, v1

    add-float/2addr v1, v0

    .line 16
    iput v1, p2, Landroid/graphics/RectF;->right:F

    .line 17
    :goto_2f
    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iput v0, p2, Landroid/graphics/RectF;->top:F

    .line 18
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    iput p1, p2, Landroid/graphics/RectF;->bottom:F

    :cond_39
    return-void
.end method

.method public d(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 30
    invoke-virtual {p0}, Lc/a/a/a/u/a;->V()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq v0, p1, :cond_3b

    .line 31
    invoke-virtual {p0}, Lc/a/a/a/u/a;->G()F

    move-result v1

    if-eqz p1, :cond_15

    .line 32
    invoke-static {p1}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    iput-object p1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    .line 33
    sget-boolean p1, Lc/a/a/a/j0/b;->a:Z

    if-eqz p1, :cond_1f

    .line 34
    invoke-virtual {p0}, Lc/a/a/a/u/a;->z0()V

    .line 35
    :cond_1f
    invoke-virtual {p0}, Lc/a/a/a/u/a;->G()F

    move-result p1

    .line 36
    invoke-virtual {p0, v0}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 37
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 38
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 39
    :cond_31
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v1, p1

    if-eqz p1, :cond_3b

    .line 40
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_3b
    return-void
.end method

.method public d(Z)V
    .registers 3

    .line 22
    iget-boolean v0, p0, Lc/a/a/a/u/a;->N:Z

    if-eq v0, p1, :cond_28

    .line 23
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    .line 24
    iput-boolean p1, p0, Lc/a/a/a/u/a;->N:Z

    .line 25
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result p1

    if-eq v0, p1, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    if-eqz v0, :cond_28

    if-eqz p1, :cond_1d

    .line 26
    iget-object p1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22

    .line 27
    :cond_1d
    iget-object p1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 28
    :goto_22
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 29
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_28
    return-void
.end method

.method public final d0()F
    .registers 4

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->A0:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    goto :goto_9

    :cond_7
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    .line 2
    :goto_9
    iget v1, p0, Lc/a/a/a/u/a;->Q:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_18

    if-eqz v0, :cond_18

    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    return v0

    .line 4
    :cond_18
    iget v0, p0, Lc/a/a/a/u/a;->Q:F

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_56

    invoke-virtual {p0}, Lc/a/a/a/u/a;->getAlpha()I

    move-result v1

    if-nez v1, :cond_11

    goto :goto_56

    :cond_11
    const/4 v1, 0x0

    .line 3
    iget v7, p0, Lc/a/a/a/u/a;->C0:I

    const/16 v8, 0xff

    if-ge v7, v8, :cond_29

    .line 4
    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v1

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v1

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v5, v1

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v1

    move-object v2, p1

    .line 5
    invoke-static/range {v2 .. v7}, Lc/a/a/a/s/a;->a(Landroid/graphics/Canvas;FFFFI)I

    move-result v1

    .line 6
    :cond_29
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->e(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 7
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->b(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 8
    iget-boolean v2, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v2, :cond_36

    .line 9
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->draw(Landroid/graphics/Canvas;)V

    .line 10
    :cond_36
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->d(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 11
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->g(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 12
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 13
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 14
    iget-boolean v2, p0, Lc/a/a/a/u/a;->M0:Z

    if-eqz v2, :cond_49

    .line 15
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->i(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 16
    :cond_49
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 17
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->h(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 18
    iget v0, p0, Lc/a/a/a/u/a;->C0:I

    if-ge v0, v8, :cond_56

    .line 19
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_56
    :goto_56
    return-void
.end method

.method public e(I)V
    .registers 3

    .line 32
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b(Z)V

    return-void
.end method

.method public e(Landroid/content/res/ColorStateList;)V
    .registers 3

    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lc/a/a/a/u/a;->R:Z

    .line 19
    iget-object v0, p0, Lc/a/a/a/u/a;->P:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1b

    .line 20
    iput-object p1, p0, Lc/a/a/a/u/a;->P:Landroid/content/res/ColorStateList;

    .line 21
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 22
    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 23
    :cond_14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_1b
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 6

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-nez v0, :cond_26

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    iget v1, p0, Lc/a/a/a/u/a;->u0:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 5
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v0

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v1

    iget-object v2, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_26
    return-void
.end method

.method public final e(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .registers 6

    .line 6
    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    .line 7
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    if-eqz v0, :cond_44

    .line 8
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->h0:F

    add-float/2addr v0, v1

    .line 9
    iget v1, p0, Lc/a/a/a/u/a;->l0:F

    invoke-virtual {p0}, Lc/a/a/a/u/a;->G()F

    move-result v2

    add-float/2addr v1, v2

    iget v2, p0, Lc/a/a/a/u/a;->i0:F

    add-float/2addr v1, v2

    .line 10
    invoke-static {p0}, Lb/h/f/l/a;->e(Landroid/graphics/drawable/Drawable;)I

    move-result v2

    if-nez v2, :cond_2e

    .line 11
    iget v2, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v0

    iput v2, p2, Landroid/graphics/RectF;->left:F

    .line 12
    iget v0, p1, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    sub-float/2addr v0, v1

    iput v0, p2, Landroid/graphics/RectF;->right:F

    goto :goto_3a

    .line 13
    :cond_2e
    iget v2, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v1

    iput v2, p2, Landroid/graphics/RectF;->left:F

    .line 14
    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->right:F

    .line 15
    :goto_3a
    iget v0, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iput v0, p2, Landroid/graphics/RectF;->top:F

    .line 16
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    iput p1, p2, Landroid/graphics/RectF;->bottom:F

    :cond_44
    return-void
.end method

.method public final e(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    if-eqz p1, :cond_6

    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_6
    return-void
.end method

.method public e(Z)V
    .registers 3

    .line 24
    iget-boolean v0, p0, Lc/a/a/a/u/a;->S:Z

    if-eq v0, p1, :cond_28

    .line 25
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    .line 26
    iput-boolean p1, p0, Lc/a/a/a/u/a;->S:Z

    .line 27
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result p1

    if-eq v0, p1, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    if-eqz v0, :cond_28

    if-eqz p1, :cond_1d

    .line 28
    iget-object p1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->a(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22

    .line 29
    :cond_1d
    iget-object p1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 30
    :goto_22
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 31
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_28
    return-void
.end method

.method public e0()Landroid/text/TextUtils$TruncateAt;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->L0:Landroid/text/TextUtils$TruncateAt;

    return-object v0
.end method

.method public f(F)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 14
    iget v0, p0, Lc/a/a/a/u/a;->I:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_13

    .line 15
    iput p1, p0, Lc/a/a/a/u/a;->I:F

    .line 16
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/m;->a(F)Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    :cond_13
    return-void
.end method

.method public f(I)V
    .registers 3

    .line 22
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->b(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public f(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 17
    iget-object v0, p0, Lc/a/a/a/u/a;->J:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_14

    .line 18
    iput-object p1, p0, Lc/a/a/a/u/a;->J:Landroid/content/res/ColorStateList;

    .line 19
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v0, :cond_d

    .line 20
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->b(Landroid/content/res/ColorStateList;)V

    .line 21
    :cond_d
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_14
    return-void
.end method

.method public final f(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 8

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->c(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 3
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 4
    iget p2, p2, Landroid/graphics/RectF;->top:F

    .line 5
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 6
    iget-object v1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    sget-boolean v1, Lc/a/a/a/j0/b;->a:Z

    if-eqz v1, :cond_42

    .line 8
    iget-object v1, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 9
    iget-object v1, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 10
    iget-object v1, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_47

    .line 11
    :cond_42
    iget-object v1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :goto_47
    neg-float v0, v0

    neg-float p2, p2

    .line 12
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_4c
    return-void
.end method

.method public f(Z)V
    .registers 2

    .line 23
    iput-boolean p1, p0, Lc/a/a/a/u/a;->M0:Z

    return-void
.end method

.method public f0()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->d0:Lc/a/a/a/m/h;

    return-object v0
.end method

.method public g(F)V
    .registers 3

    .line 16
    iget v0, p0, Lc/a/a/a/u/a;->l0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 17
    iput p1, p0, Lc/a/a/a/u/a;->l0:F

    .line 18
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 19
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_e
    return-void
.end method

.method public g(I)V
    .registers 3

    .line 15
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final g(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 12
    iget-object v0, p0, Lc/a/a/a/u/a;->F:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_d

    .line 13
    iput-object p1, p0, Lc/a/a/a/u/a;->F:Landroid/content/res/ColorStateList;

    .line 14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_d
    return-void
.end method

.method public final g(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 6

    .line 5
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    iget v1, p0, Lc/a/a/a/u/a;->y0:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 7
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 8
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-nez v0, :cond_27

    .line 9
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v0

    invoke-virtual {p0}, Lc/a/a/a/u/a;->M()F

    move-result v1

    iget-object v2, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_3c

    .line 10
    :cond_27
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object p2, p0, Lc/a/a/a/u/a;->s0:Landroid/graphics/Path;

    invoke-virtual {p0, v0, p2}, Lc/a/a/a/l0/h;->b(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 11
    iget-object p2, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    iget-object v0, p0, Lc/a/a/a/u/a;->s0:Landroid/graphics/Path;

    invoke-virtual {p0}, Lc/a/a/a/l0/h;->e()Landroid/graphics/RectF;

    move-result-object v1

    invoke-super {p0, p1, p2, v0, v1}, Lc/a/a/a/l0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Landroid/graphics/RectF;)V

    :goto_3c
    return-void
.end method

.method public g(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->I0:Z

    if-eq v0, p1, :cond_10

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/u/a;->I0:Z

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/u/a;->y0()V

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_10
    return-void
.end method

.method public g0()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->g0:F

    return v0
.end method

.method public getAlpha()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->C0:I

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->D0:Landroid/graphics/ColorFilter;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->H:F

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 4

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->h0:F

    add-float/2addr v0, v1

    iget-object v1, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/u/a;->k0()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lc/a/a/a/d0/j;->a(Ljava/lang/String;)F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->i0:F

    add-float/2addr v0, v1

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/u/a;->G()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/u/a;->l0:F

    add-float/2addr v0, v1

    .line 5
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 6
    iget v1, p0, Lc/a/a/a/u/a;->N0:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public getOutline(Landroid/graphics/Outline;)V
    .registers 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->getOutline(Landroid/graphics/Outline;)V

    return-void

    .line 3
    :cond_8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_18

    .line 5
    iget v1, p0, Lc/a/a/a/u/a;->I:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    goto :goto_28

    :cond_18
    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {p0}, Lc/a/a/a/u/a;->getIntrinsicHeight()I

    move-result v6

    iget v7, p0, Lc/a/a/a/u/a;->I:F

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 7
    :goto_28
    invoke-virtual {p0}, Lc/a/a/a/u/a;->getAlpha()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/graphics/Outline;->setAlpha(F)V

    return-void
.end method

.method public h(F)V
    .registers 3

    .line 20
    iget v0, p0, Lc/a/a/a/u/a;->Q:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1a

    .line 21
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    .line 22
    iput p1, p0, Lc/a/a/a/u/a;->Q:F

    .line 23
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 24
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_1a

    .line 25
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_1a
    return-void
.end method

.method public h(I)V
    .registers 3

    .line 31
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->c(Z)V

    return-void
.end method

.method public h(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 26
    iget-object v0, p0, Lc/a/a/a/u/a;->V:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_18

    .line 27
    iput-object p1, p0, Lc/a/a/a/u/a;->V:Landroid/content/res/ColorStateList;

    .line 28
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 29
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 30
    :cond_11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_18
    return-void
.end method

.method public final h(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 12

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    if-eqz v0, :cond_85

    const/high16 v1, -0x1000000

    const/16 v2, 0x7f

    .line 2
    invoke-static {v1, v2}, Lb/h/f/a;->c(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v0

    if-nez v0, :cond_20

    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 5
    :cond_20
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 7
    :cond_2c
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    if-eqz v0, :cond_44

    .line 8
    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v0

    .line 9
    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    iget v0, p2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v0

    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v7

    iget-object v8, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    move-object v3, p1

    .line 10
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 11
    :cond_44
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v0

    if-eqz v0, :cond_56

    .line 12
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->c(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 13
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 14
    :cond_56
    iget-object v0, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    invoke-static {v1, v2}, Lb/h/f/a;->c(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->b(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 16
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 17
    iget-object v0, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    const v1, -0xff0100

    invoke-static {v1, v2}, Lb/h/f/a;->c(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->d(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 19
    iget-object p2, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    iget-object v0, p0, Lc/a/a/a/u/a;->o0:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_85
    return-void
.end method

.method public h0()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->f0:F

    return v0
.end method

.method public i(F)V
    .registers 3

    .line 21
    iget v0, p0, Lc/a/a/a/u/a;->H:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 22
    iput p1, p0, Lc/a/a/a/u/a;->H:F

    .line 23
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 24
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_e
    return-void
.end method

.method public i(I)V
    .registers 3

    .line 20
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->d(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public i(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 25
    iget-object v0, p0, Lc/a/a/a/u/a;->L:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_10

    .line 26
    iput-object p1, p0, Lc/a/a/a/u/a;->L:Landroid/content/res/ColorStateList;

    .line 27
    invoke-virtual {p0}, Lc/a/a/a/u/a;->y0()V

    .line 28
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_10
    return-void
.end method

.method public final i(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 12

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    if-eqz v0, :cond_95

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->r0:Landroid/graphics/PointF;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/u/a;->a(Landroid/graphics/Rect;Landroid/graphics/PointF;)Landroid/graphics/Paint$Align;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p0, p2, v1}, Lc/a/a/a/u/a;->e(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    .line 4
    iget-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {p2}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object p2

    if-eqz p2, :cond_2a

    .line 5
    iget-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {p2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    iput-object v1, p2, Landroid/text/TextPaint;->drawableState:[I

    .line 6
    iget-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    iget-object v1, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {p2, v1}, Lc/a/a/a/d0/j;->a(Landroid/content/Context;)V

    .line 7
    :cond_2a
    iget-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {p2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 8
    iget-object p2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/u/a;->k0()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lc/a/a/a/d0/j;->a(Ljava/lang/String;)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    .line 10
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v1, 0x0

    if-le p2, v0, :cond_54

    const/4 p2, 0x1

    goto :goto_55

    :cond_54
    const/4 p2, 0x0

    :goto_55
    if-eqz p2, :cond_60

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 12
    iget-object v0, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 13
    :cond_60
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    if-eqz p2, :cond_7a

    .line 14
    iget-object v2, p0, Lc/a/a/a/u/a;->L0:Landroid/text/TextUtils$TruncateAt;

    if-eqz v2, :cond_7a

    .line 15
    iget-object v2, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 16
    invoke-virtual {v2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v2

    iget-object v3, p0, Lc/a/a/a/u/a;->q0:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lc/a/a/a/u/a;->L0:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v0, v2, v3, v4}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v0

    :cond_7a
    move-object v3, v0

    const/4 v4, 0x0

    .line 17
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    iget-object v0, p0, Lc/a/a/a/u/a;->r0:Landroid/graphics/PointF;

    iget v6, v0, Landroid/graphics/PointF;->x:F

    iget v7, v0, Landroid/graphics/PointF;->y:F

    iget-object v0, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v8

    move-object v2, p1

    .line 18
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    if-eqz p2, :cond_95

    .line 19
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_95
    return-void
.end method

.method public i0()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->L:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 2
    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_9
    return-void
.end method

.method public isStateful()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->F:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lc/a/a/a/u/a;->j(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lc/a/a/a/u/a;->G:Landroid/content/res/ColorStateList;

    .line 2
    invoke-static {v0}, Lc/a/a/a/u/a;->j(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lc/a/a/a/u/a;->J:Landroid/content/res/ColorStateList;

    .line 3
    invoke-static {v0}, Lc/a/a/a/u/a;->j(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-boolean v0, p0, Lc/a/a/a/u/a;->I0:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lc/a/a/a/u/a;->J0:Landroid/content/res/ColorStateList;

    .line 4
    invoke-static {v0}, Lc/a/a/a/u/a;->j(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_51

    :cond_24
    iget-object v0, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    .line 5
    invoke-virtual {v0}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/u/a;->b(Lc/a/a/a/i0/d;)Z

    move-result v0

    if-nez v0, :cond_51

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->I()Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    .line 7
    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    .line 8
    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    .line 9
    invoke-static {v0}, Lc/a/a/a/u/a;->j(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-eqz v0, :cond_4f

    goto :goto_51

    :cond_4f
    const/4 v0, 0x0

    goto :goto_52

    :cond_51
    :goto_51
    const/4 v0, 0x1

    :goto_52
    return v0
.end method

.method public j(F)V
    .registers 3

    .line 3
    iget v0, p0, Lc/a/a/a/u/a;->e0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 4
    iput p1, p0, Lc/a/a/a/u/a;->e0:F

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_e
    return-void
.end method

.method public j(I)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->f(F)V

    return-void
.end method

.method public j0()Lc/a/a/a/m/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->c0:Lc/a/a/a/m/h;

    return-object v0
.end method

.method public k(F)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->K:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_17

    .line 2
    iput p1, p0, Lc/a/a/a/u/a;->K:F

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->n0:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 4
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v0, :cond_14

    .line 5
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->e(F)V

    .line 6
    :cond_14
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_17
    return-void
.end method

.method public k(I)V
    .registers 3

    .line 7
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->g(F)V

    return-void
.end method

.method public k0()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->M:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public l(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->k0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_14

    .line 3
    iput p1, p0, Lc/a/a/a/u/a;->k0:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_14
    return-void
.end method

.method public l(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->c(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public l0()Lc/a/a/a/i0/d;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->t0:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v0

    return-object v0
.end method

.method public m(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->W:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_14

    .line 3
    iput p1, p0, Lc/a/a/a/u/a;->W:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_14
    return-void
.end method

.method public m(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->h(F)V

    return-void
.end method

.method public m0()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->i0:F

    return v0
.end method

.method public n(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->j0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_14

    .line 3
    iput p1, p0, Lc/a/a/a/u/a;->j0:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_14
    return-void
.end method

.method public n(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->e(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public n0()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->h0:F

    return v0
.end method

.method public o(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->g0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1a

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    .line 4
    iput p1, p0, Lc/a/a/a/u/a;->g0:F

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_1a

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_1a
    return-void
.end method

.method public o(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->d(Z)V

    return-void
.end method

.method public final o0()Landroid/graphics/ColorFilter;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->D0:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_5

    goto :goto_7

    :cond_5
    iget-object v0, p0, Lc/a/a/a/u/a;->E0:Landroid/graphics/PorterDuffColorFilter;

    :goto_7
    return-object v0
.end method

.method public onLayoutDirectionChanged(I)Z
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onLayoutDirectionChanged(I)Z

    move-result v0

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 3
    iget-object v1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    or-int/2addr v0, v1

    .line 4
    :cond_11
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 5
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    or-int/2addr v0, v1

    .line 6
    :cond_1e
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 7
    iget-object v1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2b
    if-eqz v0, :cond_30

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_30
    const/4 p1, 0x1

    return p1
.end method

.method public onLevelChange(I)Z
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onLevelChange(I)Z

    move-result v0

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 3
    iget-object v1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v1

    or-int/2addr v0, v1

    .line 4
    :cond_11
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 5
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v1

    or-int/2addr v0, v1

    .line 6
    :cond_1e
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 7
    iget-object v1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2b
    if-eqz v0, :cond_30

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_30
    return v0
.end method

.method public onStateChange([I)Z
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->O0:Z

    if-eqz v0, :cond_7

    .line 2
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->onStateChange([I)Z

    .line 3
    :cond_7
    invoke-virtual {p0}, Lc/a/a/a/u/a;->a0()[I

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/u/a;->a([I[I)Z

    move-result p1

    return p1
.end method

.method public p(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->f0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1a

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result v0

    .line 4
    iput p1, p0, Lc/a/a/a/u/a;->f0:F

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->F()F

    move-result p1

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_1a

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_1a
    return-void
.end method

.method public p(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->i(F)V

    return-void
.end method

.method public p0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->I0:Z

    return v0
.end method

.method public q(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->i0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 3
    iput p1, p0, Lc/a/a/a/u/a;->i0:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_e
    return-void
.end method

.method public q(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->j(F)V

    return-void
.end method

.method public q0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->Y:Z

    return v0
.end method

.method public r(F)V
    .registers 3

    .line 2
    iget v0, p0, Lc/a/a/a/u/a;->h0:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 3
    iput p1, p0, Lc/a/a/a/u/a;->h0:F

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/u/a;->t0()V

    :cond_e
    return-void
.end method

.method public r(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->f(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public r0()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lc/a/a/a/u/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    return v0
.end method

.method public s(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->k(F)V

    return-void
.end method

.method public s0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->S:Z

    return v0
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 2
    invoke-interface {p1, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/u/a;->C0:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lc/a/a/a/u/a;->C0:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->D0:Landroid/graphics/ColorFilter;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lc/a/a/a/u/a;->D0:Landroid/graphics/ColorFilter;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_9
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_d

    .line 2
    iput-object p1, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->onStateChange([I)Z

    :cond_d
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->G0:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_11

    .line 2
    iput-object p1, p0, Lc/a/a/a/u/a;->G0:Landroid/graphics/PorterDuff$Mode;

    .line 3
    iget-object v0, p0, Lc/a/a/a/u/a;->F0:Landroid/content/res/ColorStateList;

    invoke-static {p0, v0, p1}, Lc/a/a/a/z/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/u/a;->E0:Landroid/graphics/PorterDuffColorFilter;

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_11
    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 5

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/u/a;->w0()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 3
    iget-object v1, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v1

    or-int/2addr v0, v1

    .line 4
    :cond_11
    invoke-virtual {p0}, Lc/a/a/a/u/a;->v0()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 5
    iget-object v1, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v1

    or-int/2addr v0, v1

    .line 6
    :cond_1e
    invoke-virtual {p0}, Lc/a/a/a/u/a;->x0()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 7
    iget-object v1, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2b
    if-eqz v0, :cond_30

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_30
    return v0
.end method

.method public t(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->l(F)V

    return-void
.end method

.method public t0()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->K0:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/u/a$a;

    if-eqz v0, :cond_d

    .line 2
    invoke-interface {v0}, Lc/a/a/a/u/a$a;->a()V

    :cond_d
    return-void
.end method

.method public u(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->d(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public u0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->M0:Z

    return v0
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 2
    invoke-interface {p1, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    :cond_9
    return-void
.end method

.method public v(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->m(F)V

    return-void
.end method

.method public final v0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->Z:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lc/a/a/a/u/a;->a0:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Lc/a/a/a/u/a;->A0:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public w(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->n(F)V

    return-void
.end method

.method public final w0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->N:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lc/a/a/a/u/a;->O:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public x(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->h(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final x0()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->S:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public y(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-static {v0, p1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->a(Lc/a/a/a/m/h;)V

    return-void
.end method

.method public final y0()V
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/u/a;->I0:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lc/a/a/a/u/a;->L:Landroid/content/res/ColorStateList;

    .line 2
    invoke-static {v0}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    iput-object v0, p0, Lc/a/a/a/u/a;->J0:Landroid/content/res/ColorStateList;

    return-void
.end method

.method public z(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/u/a;->m0:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lc/a/a/a/u/a;->o(F)V

    return-void
.end method

.method public final z0()V
    .registers 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/u/a;->i0()Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {v1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v2, p0, Lc/a/a/a/u/a;->T:Landroid/graphics/drawable/Drawable;

    sget-object v3, Lc/a/a/a/u/a;->Q0:Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lc/a/a/a/u/a;->U:Landroid/graphics/drawable/Drawable;

    return-void
.end method
