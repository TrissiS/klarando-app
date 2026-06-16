.class public Lc/c/c/d/c;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "ShapeState.java"


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public a:I

.field public b:I

.field public c:I

.field public d:Lc/c/c/d/b;

.field public e:[I

.field public f:[I

.field public g:[F

.field public h:[F

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public m:F

.field public n:F

.field public o:F

.field public p:[F

.field public q:Landroid/graphics/Rect;

.field public r:I

.field public s:I

.field public t:F

.field public u:F

.field public v:I

.field public w:I

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lc/c/c/d/c;->b:I

    .line 3
    iput v0, p0, Lc/c/c/d/c;->c:I

    .line 4
    sget-object v0, Lc/c/c/d/b;->TOP_BOTTOM:Lc/c/c/d/b;

    iput-object v0, p0, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lc/c/c/d/c;->k:I

    .line 6
    iput v0, p0, Lc/c/c/d/c;->r:I

    .line 7
    iput v0, p0, Lc/c/c/d/c;->s:I

    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    iput v0, p0, Lc/c/c/d/c;->x:F

    .line 9
    iput v0, p0, Lc/c/c/d/c;->y:F

    .line 10
    iput v0, p0, Lc/c/c/d/c;->z:F

    return-void
.end method

.method public constructor <init>(Lc/c/c/d/c;)V
    .registers 4

    .line 11
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lc/c/c/d/c;->b:I

    .line 13
    iput v0, p0, Lc/c/c/d/c;->c:I

    .line 14
    sget-object v0, Lc/c/c/d/b;->TOP_BOTTOM:Lc/c/c/d/b;

    iput-object v0, p0, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lc/c/c/d/c;->k:I

    .line 16
    iput v0, p0, Lc/c/c/d/c;->r:I

    .line 17
    iput v0, p0, Lc/c/c/d/c;->s:I

    const/high16 v0, 0x3f000000    # 0.5f

    .line 18
    iput v0, p0, Lc/c/c/d/c;->x:F

    .line 19
    iput v0, p0, Lc/c/c/d/c;->y:F

    .line 20
    iput v0, p0, Lc/c/c/d/c;->z:F

    .line 21
    iget v0, p1, Lc/c/c/d/c;->a:I

    iput v0, p0, Lc/c/c/d/c;->a:I

    .line 22
    iget v0, p1, Lc/c/c/d/c;->b:I

    iput v0, p0, Lc/c/c/d/c;->b:I

    .line 23
    iget v0, p1, Lc/c/c/d/c;->c:I

    iput v0, p0, Lc/c/c/d/c;->c:I

    .line 24
    iget-object v0, p1, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    iput-object v0, p0, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    .line 25
    iget-object v0, p1, Lc/c/c/d/c;->e:[I

    if-eqz v0, :cond_37

    .line 26
    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Lc/c/c/d/c;->e:[I

    .line 27
    :cond_37
    iget-object v0, p1, Lc/c/c/d/c;->h:[F

    if-eqz v0, :cond_43

    .line 28
    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lc/c/c/d/c;->h:[F

    .line 29
    :cond_43
    iget-boolean v0, p1, Lc/c/c/d/c;->i:Z

    iput-boolean v0, p0, Lc/c/c/d/c;->i:Z

    .line 30
    iget v0, p1, Lc/c/c/d/c;->j:I

    iput v0, p0, Lc/c/c/d/c;->j:I

    .line 31
    iget v0, p1, Lc/c/c/d/c;->k:I

    iput v0, p0, Lc/c/c/d/c;->k:I

    .line 32
    iget v0, p1, Lc/c/c/d/c;->l:I

    iput v0, p0, Lc/c/c/d/c;->l:I

    .line 33
    iget v0, p1, Lc/c/c/d/c;->m:F

    iput v0, p0, Lc/c/c/d/c;->m:F

    .line 34
    iget v0, p1, Lc/c/c/d/c;->n:F

    iput v0, p0, Lc/c/c/d/c;->n:F

    .line 35
    iget v0, p1, Lc/c/c/d/c;->o:F

    iput v0, p0, Lc/c/c/d/c;->o:F

    .line 36
    iget-object v0, p1, Lc/c/c/d/c;->p:[F

    if-eqz v0, :cond_6b

    .line 37
    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lc/c/c/d/c;->p:[F

    .line 38
    :cond_6b
    iget-object v0, p1, Lc/c/c/d/c;->q:Landroid/graphics/Rect;

    if-eqz v0, :cond_78

    .line 39
    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p1, Lc/c/c/d/c;->q:Landroid/graphics/Rect;

    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lc/c/c/d/c;->q:Landroid/graphics/Rect;

    .line 40
    :cond_78
    iget v0, p1, Lc/c/c/d/c;->r:I

    iput v0, p0, Lc/c/c/d/c;->r:I

    .line 41
    iget v0, p1, Lc/c/c/d/c;->s:I

    iput v0, p0, Lc/c/c/d/c;->s:I

    .line 42
    iget v0, p1, Lc/c/c/d/c;->t:F

    iput v0, p0, Lc/c/c/d/c;->t:F

    .line 43
    iget v0, p1, Lc/c/c/d/c;->u:F

    iput v0, p0, Lc/c/c/d/c;->u:F

    .line 44
    iget v0, p1, Lc/c/c/d/c;->v:I

    iput v0, p0, Lc/c/c/d/c;->v:I

    .line 45
    iget v0, p1, Lc/c/c/d/c;->w:I

    iput v0, p0, Lc/c/c/d/c;->w:I

    .line 46
    iget v0, p1, Lc/c/c/d/c;->x:F

    iput v0, p0, Lc/c/c/d/c;->x:F

    .line 47
    iget v0, p1, Lc/c/c/d/c;->y:F

    iput v0, p0, Lc/c/c/d/c;->y:F

    .line 48
    iget v0, p1, Lc/c/c/d/c;->z:F

    iput v0, p0, Lc/c/c/d/c;->z:F

    .line 49
    iget-boolean v0, p1, Lc/c/c/d/c;->A:Z

    iput-boolean v0, p0, Lc/c/c/d/c;->A:Z

    .line 50
    iget-boolean v0, p1, Lc/c/c/d/c;->B:Z

    iput-boolean v0, p0, Lc/c/c/d/c;->B:Z

    .line 51
    iget-boolean v0, p1, Lc/c/c/d/c;->C:Z

    iput-boolean v0, p0, Lc/c/c/d/c;->C:Z

    .line 52
    iget v0, p1, Lc/c/c/d/c;->D:I

    iput v0, p0, Lc/c/c/d/c;->D:I

    .line 53
    iget v0, p1, Lc/c/c/d/c;->E:I

    iput v0, p0, Lc/c/c/d/c;->E:I

    .line 54
    iget v0, p1, Lc/c/c/d/c;->F:I

    iput v0, p0, Lc/c/c/d/c;->F:I

    .line 55
    iget p1, p1, Lc/c/c/d/c;->G:I

    iput p1, p0, Lc/c/c/d/c;->G:I

    return-void
.end method

.method public static h(I)Z
    .registers 2

    shr-int/lit8 p0, p0, 0x18

    const/16 v0, 0xff

    and-int/2addr p0, v0

    if-ne p0, v0, :cond_9

    const/4 p0, 0x1

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    return p0
.end method


# virtual methods
.method public final a()V
    .registers 6

    .line 7
    iget v0, p0, Lc/c/c/d/c;->b:I

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 8
    iput-boolean v1, p0, Lc/c/c/d/c;->C:Z

    return-void

    .line 9
    :cond_8
    iget v0, p0, Lc/c/c/d/c;->o:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_4a

    iget-object v0, p0, Lc/c/c/d/c;->p:[F

    if-eqz v0, :cond_14

    goto :goto_4a

    .line 10
    :cond_14
    iget v0, p0, Lc/c/c/d/c;->k:I

    if-lez v0, :cond_23

    iget v0, p0, Lc/c/c/d/c;->l:I

    invoke-static {v0}, Lc/c/c/d/c;->h(I)Z

    move-result v0

    if-nez v0, :cond_23

    .line 11
    iput-boolean v1, p0, Lc/c/c/d/c;->C:Z

    return-void

    .line 12
    :cond_23
    iget-boolean v0, p0, Lc/c/c/d/c;->i:Z

    if-eqz v0, :cond_30

    .line 13
    iget v0, p0, Lc/c/c/d/c;->j:I

    invoke-static {v0}, Lc/c/c/d/c;->h(I)Z

    move-result v0

    iput-boolean v0, p0, Lc/c/c/d/c;->C:Z

    return-void

    .line 14
    :cond_30
    iget-object v0, p0, Lc/c/c/d/c;->e:[I

    if-eqz v0, :cond_46

    .line 15
    array-length v2, v0

    const/4 v3, 0x0

    :goto_36
    if-ge v3, v2, :cond_46

    aget v4, v0, v3

    .line 16
    invoke-static {v4}, Lc/c/c/d/c;->h(I)Z

    move-result v4

    if-nez v4, :cond_43

    .line 17
    iput-boolean v1, p0, Lc/c/c/d/c;->C:Z

    return-void

    :cond_43
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    :cond_46
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lc/c/c/d/c;->C:Z

    return-void

    .line 19
    :cond_4a
    :goto_4a
    iput-boolean v1, p0, Lc/c/c/d/c;->C:Z

    return-void
.end method

.method public a(F)V
    .registers 4

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gez v1, :cond_6

    const/4 p1, 0x0

    .line 25
    :cond_6
    iput p1, p0, Lc/c/c/d/c;->o:F

    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lc/c/c/d/c;->p:[F

    return-void
.end method

.method public a(FF)V
    .registers 3

    .line 2
    iput p1, p0, Lc/c/c/d/c;->x:F

    .line 3
    iput p2, p0, Lc/c/c/d/c;->y:F

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->c:I

    return-void
.end method

.method public a(II)V
    .registers 3

    .line 29
    iput p1, p0, Lc/c/c/d/c;->r:I

    .line 30
    iput p2, p0, Lc/c/c/d/c;->s:I

    return-void
.end method

.method public a(IIFF)V
    .registers 5

    .line 20
    iput p1, p0, Lc/c/c/d/c;->k:I

    .line 21
    iput p2, p0, Lc/c/c/d/c;->l:I

    .line 22
    iput p3, p0, Lc/c/c/d/c;->m:F

    .line 23
    iput p4, p0, Lc/c/c/d/c;->n:F

    .line 24
    invoke-virtual {p0}, Lc/c/c/d/c;->a()V

    return-void
.end method

.method public a([F)V
    .registers 2

    .line 27
    iput-object p1, p0, Lc/c/c/d/c;->p:[F

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lc/c/c/d/c;->o:F

    :cond_7
    return-void
.end method

.method public a([I)V
    .registers 3

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lc/c/c/d/c;->i:Z

    .line 5
    iput-object p1, p0, Lc/c/c/d/c;->e:[I

    .line 6
    invoke-virtual {p0}, Lc/c/c/d/c;->a()V

    return-void
.end method

.method public b(F)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->z:F

    return-void
.end method

.method public b(I)V
    .registers 2

    .line 2
    iput p1, p0, Lc/c/c/d/c;->E:I

    return-void
.end method

.method public c(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->F:I

    return-void
.end method

.method public d(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->G:I

    return-void
.end method

.method public e(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->D:I

    return-void
.end method

.method public f(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/c/d/c;->b:I

    .line 2
    invoke-virtual {p0}, Lc/c/c/d/c;->a()V

    return-void
.end method

.method public g(I)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lc/c/c/d/c;->i:Z

    .line 2
    iput p1, p0, Lc/c/c/d/c;->j:I

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Lc/c/c/d/c;->e:[I

    .line 4
    invoke-virtual {p0}, Lc/c/c/d/c;->a()V

    return-void
.end method

.method public getChangingConfigurations()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/c/d/c;->a:I

    return v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    new-instance v0, Lc/c/c/d/a;

    invoke-direct {v0, p0}, Lc/c/c/d/a;-><init>(Lc/c/c/d/c;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 2
    new-instance p1, Lc/c/c/d/a;

    invoke-direct {p1, p0}, Lc/c/c/d/a;-><init>(Lc/c/c/d/c;)V

    return-object p1
.end method
