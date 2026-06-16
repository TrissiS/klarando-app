.class public final Lc/c/c/c/b;
.super Ljava/lang/Object;
.source "ShapeDrawableBuilder.java"


# instance fields
.field public A:Ljava/lang/Integer;

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:F

.field public G:I

.field public H:F

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public final a:Landroid/view/View;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/Integer;

.field public g:Ljava/lang/Integer;

.field public h:Ljava/lang/Integer;

.field public i:Ljava/lang/Integer;

.field public j:Ljava/lang/Integer;

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:[I

.field public p:Z

.field public q:I

.field public r:I

.field public s:F

.field public t:F

.field public u:I

.field public v:I

.field public w:Ljava/lang/Integer;

.field public x:Ljava/lang/Integer;

.field public y:Ljava/lang/Integer;

.field public z:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/content/res/TypedArray;Lc/c/c/f/c;)V
    .registers 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/c/c/c/b;->a:Landroid/view/View;

    .line 3
    invoke-interface {p3}, Lc/c/c/f/c;->u()I

    move-result p1

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->b:I

    .line 4
    invoke-interface {p3}, Lc/c/c/f/c;->K()I

    move-result p1

    const/4 v1, -0x1

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->c:I

    .line 5
    invoke-interface {p3}, Lc/c/c/f/c;->d()I

    move-result p1

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->d:I

    .line 6
    invoke-interface {p3}, Lc/c/c/f/c;->f()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->e:I

    .line 7
    invoke-interface {p3}, Lc/c/c/f/c;->r()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_47

    .line 8
    invoke-interface {p3}, Lc/c/c/f/c;->r()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->f:Ljava/lang/Integer;

    .line 9
    :cond_47
    invoke-interface {p3}, Lc/c/c/f/c;->L()I

    move-result p1

    if-lez p1, :cond_65

    invoke-interface {p3}, Lc/c/c/f/c;->L()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_65

    .line 10
    invoke-interface {p3}, Lc/c/c/f/c;->L()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->g:Ljava/lang/Integer;

    .line 11
    :cond_65
    invoke-interface {p3}, Lc/c/c/f/c;->h()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_7d

    .line 12
    invoke-interface {p3}, Lc/c/c/f/c;->h()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->h:Ljava/lang/Integer;

    .line 13
    :cond_7d
    invoke-interface {p3}, Lc/c/c/f/c;->x()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_95

    .line 14
    invoke-interface {p3}, Lc/c/c/f/c;->x()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->i:Ljava/lang/Integer;

    .line 15
    :cond_95
    invoke-interface {p3}, Lc/c/c/f/c;->A()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_ad

    .line 16
    invoke-interface {p3}, Lc/c/c/f/c;->A()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->j:Ljava/lang/Integer;

    .line 17
    :cond_ad
    invoke-interface {p3}, Lc/c/c/f/c;->w()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    .line 18
    invoke-interface {p3}, Lc/c/c/f/c;->Q()I

    move-result v2

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lc/c/c/c/b;->k:F

    .line 19
    invoke-interface {p3}, Lc/c/c/f/c;->m()I

    move-result v2

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lc/c/c/c/b;->l:F

    .line 20
    invoke-interface {p3}, Lc/c/c/f/c;->M()I

    move-result v2

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lc/c/c/c/b;->m:F

    .line 21
    invoke-interface {p3}, Lc/c/c/f/c;->j()I

    move-result v2

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lc/c/c/c/b;->n:F

    .line 22
    invoke-interface {p3}, Lc/c/c/f/c;->F()I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_13d

    invoke-interface {p3}, Lc/c/c/f/c;->Y()I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_13d

    .line 23
    invoke-interface {p3}, Lc/c/c/f/c;->k()I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eqz v2, :cond_125

    const/4 v2, 0x3

    new-array v2, v2, [I

    .line 24
    invoke-interface {p3}, Lc/c/c/f/c;->F()I

    move-result v5

    invoke-virtual {p2, v5, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    aput v5, v2, v0

    .line 25
    invoke-interface {p3}, Lc/c/c/f/c;->k()I

    move-result v5

    invoke-virtual {p2, v5, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    aput v5, v2, v3

    .line 26
    invoke-interface {p3}, Lc/c/c/f/c;->Y()I

    move-result v3

    invoke-virtual {p2, v3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    aput v3, v2, v4

    iput-object v2, p0, Lc/c/c/c/b;->o:[I

    goto :goto_13d

    :cond_125
    new-array v2, v4, [I

    .line 27
    invoke-interface {p3}, Lc/c/c/f/c;->F()I

    move-result v4

    invoke-virtual {p2, v4, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    aput v4, v2, v0

    .line 28
    invoke-interface {p3}, Lc/c/c/f/c;->Y()I

    move-result v4

    invoke-virtual {p2, v4, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    aput v4, v2, v3

    iput-object v2, p0, Lc/c/c/c/b;->o:[I

    .line 29
    :cond_13d
    :goto_13d
    invoke-interface {p3}, Lc/c/c/f/c;->o()I

    move-result v2

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lc/c/c/c/b;->p:Z

    .line 30
    invoke-interface {p3}, Lc/c/c/f/c;->e()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lc/c/c/c/b;->q:I

    .line 31
    invoke-interface {p3}, Lc/c/c/f/c;->b0()I

    move-result v2

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lc/c/c/c/b;->r:I

    .line 32
    invoke-interface {p3}, Lc/c/c/f/c;->D()I

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lc/c/c/c/b;->s:F

    .line 33
    invoke-interface {p3}, Lc/c/c/f/c;->T()I

    move-result v2

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lc/c/c/c/b;->t:F

    .line 34
    invoke-interface {p3}, Lc/c/c/f/c;->i()I

    move-result v2

    invoke-virtual {p2, v2, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->u:I

    .line 35
    invoke-interface {p3}, Lc/c/c/f/c;->X()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->v:I

    .line 36
    invoke-interface {p3}, Lc/c/c/f/c;->b()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_19f

    .line 37
    invoke-interface {p3}, Lc/c/c/f/c;->b()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->w:Ljava/lang/Integer;

    .line 38
    :cond_19f
    invoke-interface {p3}, Lc/c/c/f/c;->l()I

    move-result p1

    if-lez p1, :cond_1bd

    invoke-interface {p3}, Lc/c/c/f/c;->l()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_1bd

    .line 39
    invoke-interface {p3}, Lc/c/c/f/c;->l()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->x:Ljava/lang/Integer;

    .line 40
    :cond_1bd
    invoke-interface {p3}, Lc/c/c/f/c;->y()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_1d5

    .line 41
    invoke-interface {p3}, Lc/c/c/f/c;->y()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->y:Ljava/lang/Integer;

    .line 42
    :cond_1d5
    invoke-interface {p3}, Lc/c/c/f/c;->E()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_1ed

    .line 43
    invoke-interface {p3}, Lc/c/c/f/c;->E()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->z:Ljava/lang/Integer;

    .line 44
    :cond_1ed
    invoke-interface {p3}, Lc/c/c/f/c;->q()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_205

    .line 45
    invoke-interface {p3}, Lc/c/c/f/c;->q()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/b;->A:Ljava/lang/Integer;

    .line 46
    :cond_205
    invoke-interface {p3}, Lc/c/c/f/c;->S()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->B:I

    .line 47
    invoke-interface {p3}, Lc/c/c/f/c;->O()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->C:I

    .line 48
    invoke-interface {p3}, Lc/c/c/f/c;->g()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->D:I

    .line 49
    invoke-interface {p3}, Lc/c/c/f/c;->W()I

    move-result p1

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->E:I

    .line 50
    invoke-interface {p3}, Lc/c/c/f/c;->R()I

    move-result p1

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->F:F

    .line 51
    invoke-interface {p3}, Lc/c/c/f/c;->n()I

    move-result p1

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->G:I

    .line 52
    invoke-interface {p3}, Lc/c/c/f/c;->J()I

    move-result p1

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->H:F

    .line 53
    invoke-interface {p3}, Lc/c/c/f/c;->p()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->I:I

    .line 54
    invoke-interface {p3}, Lc/c/c/f/c;->N()I

    move-result p1

    const/high16 v1, 0x10000000

    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->J:I

    .line 55
    invoke-interface {p3}, Lc/c/c/f/c;->a()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->K:I

    .line 56
    invoke-interface {p3}, Lc/c/c/f/c;->s()I

    move-result p1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lc/c/c/c/b;->L:I

    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/drawable/Drawable;
    .registers 8

    .line 1
    invoke-virtual {p0}, Lc/c/c/c/b;->d()Z

    move-result v0

    if-nez v0, :cond_10

    iget v0, p0, Lc/c/c/c/b;->e:I

    if-nez v0, :cond_10

    iget v0, p0, Lc/c/c/c/b;->v:I

    if-nez v0, :cond_10

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_10
    iget v0, p0, Lc/c/c/c/b;->e:I

    iget v1, p0, Lc/c/c/c/b;->v:I

    invoke-virtual {p0, v0, v1}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Lc/c/c/c/b;->d()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 4
    iget-object v1, p0, Lc/c/c/c/b;->o:[I

    invoke-virtual {v0, v1}, Lc/c/c/d/a;->a([I)Lc/c/c/d/a;

    .line 5
    :cond_23
    iget-object v1, p0, Lc/c/c/c/b;->f:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->w:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->g:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->x:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->h:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->y:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->i:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->z:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->j:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    iget-object v1, p0, Lc/c/c/c/b;->A:Ljava/lang/Integer;

    if-eqz v1, :cond_4c

    return-object v0

    .line 6
    :cond_4c
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 7
    iget-object v2, p0, Lc/c/c/c/b;->f:Ljava/lang/Integer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_5b

    iget-object v2, p0, Lc/c/c/c/b;->w:Ljava/lang/Integer;

    if-eqz v2, :cond_7f

    :cond_5b
    new-array v2, v3, [I

    const v5, 0x10100a7

    aput v5, v2, v4

    .line 8
    iget-object v5, p0, Lc/c/c/c/b;->f:Ljava/lang/Integer;

    if-eqz v5, :cond_6b

    .line 9
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_6d

    :cond_6b
    iget v5, p0, Lc/c/c/c/b;->e:I

    :goto_6d
    iget-object v6, p0, Lc/c/c/c/b;->w:Ljava/lang/Integer;

    if-eqz v6, :cond_76

    .line 10
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_78

    :cond_76
    iget v6, p0, Lc/c/c/c/b;->v:I

    .line 11
    :goto_78
    invoke-virtual {p0, v5, v6}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 12
    :cond_7f
    iget-object v2, p0, Lc/c/c/c/b;->g:Ljava/lang/Integer;

    if-nez v2, :cond_87

    iget-object v2, p0, Lc/c/c/c/b;->x:Ljava/lang/Integer;

    if-eqz v2, :cond_ab

    :cond_87
    new-array v2, v3, [I

    const v5, 0x10100a0

    aput v5, v2, v4

    .line 13
    iget-object v5, p0, Lc/c/c/c/b;->g:Ljava/lang/Integer;

    if-eqz v5, :cond_97

    .line 14
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_99

    :cond_97
    iget v5, p0, Lc/c/c/c/b;->e:I

    :goto_99
    iget-object v6, p0, Lc/c/c/c/b;->x:Ljava/lang/Integer;

    if-eqz v6, :cond_a2

    .line 15
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_a4

    :cond_a2
    iget v6, p0, Lc/c/c/c/b;->v:I

    .line 16
    :goto_a4
    invoke-virtual {p0, v5, v6}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 17
    :cond_ab
    iget-object v2, p0, Lc/c/c/c/b;->h:Ljava/lang/Integer;

    if-nez v2, :cond_b3

    iget-object v2, p0, Lc/c/c/c/b;->y:Ljava/lang/Integer;

    if-eqz v2, :cond_d7

    :cond_b3
    new-array v2, v3, [I

    const v5, -0x101009e

    aput v5, v2, v4

    .line 18
    iget-object v5, p0, Lc/c/c/c/b;->h:Ljava/lang/Integer;

    if-eqz v5, :cond_c3

    .line 19
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_c5

    :cond_c3
    iget v5, p0, Lc/c/c/c/b;->e:I

    :goto_c5
    iget-object v6, p0, Lc/c/c/c/b;->y:Ljava/lang/Integer;

    if-eqz v6, :cond_ce

    .line 20
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_d0

    :cond_ce
    iget v6, p0, Lc/c/c/c/b;->v:I

    .line 21
    :goto_d0
    invoke-virtual {p0, v5, v6}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 22
    :cond_d7
    iget-object v2, p0, Lc/c/c/c/b;->i:Ljava/lang/Integer;

    if-nez v2, :cond_df

    iget-object v2, p0, Lc/c/c/c/b;->z:Ljava/lang/Integer;

    if-eqz v2, :cond_103

    :cond_df
    new-array v2, v3, [I

    const v5, 0x101009c

    aput v5, v2, v4

    .line 23
    iget-object v5, p0, Lc/c/c/c/b;->i:Ljava/lang/Integer;

    if-eqz v5, :cond_ef

    .line 24
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_f1

    :cond_ef
    iget v5, p0, Lc/c/c/c/b;->e:I

    :goto_f1
    iget-object v6, p0, Lc/c/c/c/b;->z:Ljava/lang/Integer;

    if-eqz v6, :cond_fa

    .line 25
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_fc

    :cond_fa
    iget v6, p0, Lc/c/c/c/b;->v:I

    .line 26
    :goto_fc
    invoke-virtual {p0, v5, v6}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 27
    :cond_103
    iget-object v2, p0, Lc/c/c/c/b;->j:Ljava/lang/Integer;

    if-nez v2, :cond_10b

    iget-object v2, p0, Lc/c/c/c/b;->A:Ljava/lang/Integer;

    if-eqz v2, :cond_12f

    :cond_10b
    new-array v2, v3, [I

    const v3, 0x10100a1

    aput v3, v2, v4

    .line 28
    iget-object v3, p0, Lc/c/c/c/b;->j:Ljava/lang/Integer;

    if-eqz v3, :cond_11b

    .line 29
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_11d

    :cond_11b
    iget v3, p0, Lc/c/c/c/b;->e:I

    :goto_11d
    iget-object v5, p0, Lc/c/c/c/b;->A:Ljava/lang/Integer;

    if-eqz v5, :cond_126

    .line 30
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_128

    :cond_126
    iget v5, p0, Lc/c/c/c/b;->v:I

    .line 31
    :goto_128
    invoke-virtual {p0, v3, v5}, Lc/c/c/c/b;->a(II)Lc/c/c/d/a;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_12f
    new-array v2, v4, [I

    .line 32
    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    return-object v1
.end method

.method public a(II)Lc/c/c/d/a;
    .registers 8

    .line 33
    new-instance v0, Lc/c/c/d/a;

    invoke-direct {v0}, Lc/c/c/d/a;-><init>()V

    .line 34
    iget v1, p0, Lc/c/c/c/b;->b:I

    invoke-virtual {v0, v1}, Lc/c/c/d/a;->i(I)Lc/c/c/d/a;

    iget v1, p0, Lc/c/c/c/b;->c:I

    iget v2, p0, Lc/c/c/c/b;->d:I

    .line 35
    invoke-virtual {v0, v1, v2}, Lc/c/c/d/a;->a(II)Lc/c/c/d/a;

    iget v1, p0, Lc/c/c/c/b;->k:F

    iget v2, p0, Lc/c/c/c/b;->l:F

    iget v3, p0, Lc/c/c/c/b;->m:F

    iget v4, p0, Lc/c/c/c/b;->n:F

    .line 36
    invoke-virtual {v0, v1, v2, v3, v4}, Lc/c/c/d/a;->a(FFFF)Lc/c/c/d/a;

    .line 37
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->j(I)Lc/c/c/d/a;

    .line 38
    invoke-virtual {p0}, Lc/c/c/c/b;->f()Z

    move-result p1

    invoke-virtual {v0, p1}, Lc/c/c/d/a;->a(Z)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->B:I

    iget v1, p0, Lc/c/c/c/b;->C:I

    int-to-float v1, v1

    iget v2, p0, Lc/c/c/c/b;->D:I

    int-to-float v2, v2

    .line 39
    invoke-virtual {v0, p1, p2, v1, v2}, Lc/c/c/d/a;->a(IIFF)Lc/c/c/d/a;

    .line 40
    iget p1, p0, Lc/c/c/c/b;->q:I

    invoke-virtual {v0, p1}, Lc/c/c/d/a;->b(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->r:I

    .line 41
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->c(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->u:I

    int-to-float p1, p1

    .line 42
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->a(F)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->s:F

    iget p2, p0, Lc/c/c/c/b;->t:F

    .line 43
    invoke-virtual {v0, p1, p2}, Lc/c/c/d/a;->a(FF)Lc/c/c/d/a;

    .line 44
    iget p1, p0, Lc/c/c/c/b;->F:F

    invoke-virtual {v0, p1}, Lc/c/c/d/a;->b(F)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->E:I

    .line 45
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->d(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->H:F

    .line 46
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->d(F)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->G:I

    .line 47
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->k(I)Lc/c/c/d/a;

    .line 48
    iget p1, p0, Lc/c/c/c/b;->I:I

    invoke-virtual {v0, p1}, Lc/c/c/d/a;->h(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->J:I

    .line 49
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->e(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->K:I

    .line 50
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->f(I)Lc/c/c/d/a;

    iget p1, p0, Lc/c/c/c/b;->L:I

    .line 51
    invoke-virtual {v0, p1}, Lc/c/c/d/a;->g(I)Lc/c/c/d/a;

    return-object v0
.end method

.method public b()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lc/c/c/c/b;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Lc/c/c/c/b;->c()Z

    move-result v1

    if-nez v1, :cond_13

    invoke-virtual {p0}, Lc/c/c/c/b;->e()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 3
    :cond_13
    iget-object v1, p0, Lc/c/c/c/b;->a:Landroid/view/View;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 4
    :cond_1a
    iget-object v1, p0, Lc/c/c/c/b;->a:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    iget v0, p0, Lc/c/c/c/b;->D:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/c/c/b;->o:[I

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget v0, p0, Lc/c/c/c/b;->I:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/c/c/c/b;->p:Z

    return v0
.end method
