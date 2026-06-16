.class public Lb/f/b/k/h;
.super Lb/f/b/k/e;
.source "Guideline.java"


# instance fields
.field public D0:F

.field public E0:I

.field public F0:I

.field public G0:Lb/f/b/k/d;

.field public H0:I


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 1
    invoke-direct {p0}, Lb/f/b/k/e;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    .line 2
    iput v0, p0, Lb/f/b/k/h;->D0:F

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lb/f/b/k/h;->E0:I

    .line 4
    iput v0, p0, Lb/f/b/k/h;->F0:I

    .line 5
    iget-object v0, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iput-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lb/f/b/k/h;->H0:I

    .line 7
    iget-object v1, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 8
    iget-object v1, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v2, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iget-object v1, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    array-length v1, v1

    :goto_22
    if-ge v0, v1, :cond_2d

    .line 10
    iget-object v2, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    iget-object v3, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    :cond_2d
    return-void
.end method


# virtual methods
.method public J()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/h;->H0:I

    return v0
.end method

.method public K()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/h;->E0:I

    return v0
.end method

.method public L()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/h;->F0:I

    return v0
.end method

.method public M()F
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/h;->D0:F

    return v0
.end method

.method public a(Lb/f/b/k/d$b;)Lb/f/b/k/d;
    .registers 4

    .line 7
    sget-object v0, Lb/f/b/k/h$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_28

    goto :goto_1d

    :pswitch_c
    const/4 p1, 0x0

    return-object p1

    .line 8
    :pswitch_e
    iget v0, p0, Lb/f/b/k/h;->H0:I

    if-nez v0, :cond_1d

    .line 9
    iget-object p1, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    return-object p1

    .line 10
    :pswitch_15
    iget v0, p0, Lb/f/b/k/h;->H0:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1d

    .line 11
    iget-object p1, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    return-object p1

    .line 12
    :cond_1d
    :goto_1d
    new-instance v0, Ljava/lang/AssertionError;

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_15
        :pswitch_15
        :pswitch_e
        :pswitch_e
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
    .end packed-switch
.end method

.method public a(Lb/f/b/d;)V
    .registers 10

    .line 13
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    check-cast v0, Lb/f/b/k/f;

    if-nez v0, :cond_9

    return-void

    .line 14
    :cond_9
    sget-object v1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    .line 15
    sget-object v2, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v0, v2}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v2

    .line 16
    iget-object v3, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_25

    iget-object v3, v3, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v3, v3, v5

    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v3, v6, :cond_25

    const/4 v3, 0x1

    goto :goto_26

    :cond_25
    const/4 v3, 0x0

    .line 17
    :goto_26
    iget v6, p0, Lb/f/b/k/h;->H0:I

    if-nez v6, :cond_45

    .line 18
    sget-object v1, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    .line 19
    sget-object v2, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v0, v2}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v2

    .line 20
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_43

    iget-object v0, v0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v4

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-ne v0, v3, :cond_43

    goto :goto_44

    :cond_43
    const/4 v4, 0x0

    :goto_44
    move v3, v4

    .line 21
    :cond_45
    iget v0, p0, Lb/f/b/k/h;->E0:I

    const/16 v4, 0x8

    const/4 v6, -0x1

    const/4 v7, 0x5

    if-eq v0, v6, :cond_66

    .line 22
    iget-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    .line 23
    invoke-virtual {p1, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    .line 24
    iget v6, p0, Lb/f/b/k/h;->E0:I

    invoke-virtual {p1, v0, v1, v6, v4}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    if-eqz v3, :cond_a2

    .line 25
    invoke-virtual {p1, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    invoke-virtual {p1, v1, v0, v5, v7}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_a2

    .line 26
    :cond_66
    iget v0, p0, Lb/f/b/k/h;->F0:I

    if-eq v0, v6, :cond_87

    .line 27
    iget-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    .line 28
    invoke-virtual {p1, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v2

    .line 29
    iget v6, p0, Lb/f/b/k/h;->F0:I

    neg-int v6, v6

    invoke-virtual {p1, v0, v2, v6, v4}, Lb/f/b/d;->a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;

    if-eqz v3, :cond_a2

    .line 30
    invoke-virtual {p1, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v5, v7}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    .line 31
    invoke-virtual {p1, v2, v0, v5, v7}, Lb/f/b/d;->b(Lb/f/b/i;Lb/f/b/i;II)V

    goto :goto_a2

    .line 32
    :cond_87
    iget v0, p0, Lb/f/b/k/h;->D0:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_a2

    .line 33
    iget-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v0

    .line 34
    invoke-virtual {p1, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    .line 35
    iget v2, p0, Lb/f/b/k/h;->D0:F

    .line 36
    invoke-static {p1, v0, v1, v2}, Lb/f/b/d;->a(Lb/f/b/d;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Lb/f/b/d;->a(Lb/f/b/b;)V

    :cond_a2
    :goto_a2
    return-void
.end method

.method public a(Lb/f/b/k/e;Ljava/util/HashMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/b/k/e;",
            "Ljava/util/HashMap<",
            "Lb/f/b/k/e;",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lb/f/b/k/e;->a(Lb/f/b/k/e;Ljava/util/HashMap;)V

    .line 2
    check-cast p1, Lb/f/b/k/h;

    .line 3
    iget p2, p1, Lb/f/b/k/h;->D0:F

    iput p2, p0, Lb/f/b/k/h;->D0:F

    .line 4
    iget p2, p1, Lb/f/b/k/h;->E0:I

    iput p2, p0, Lb/f/b/k/h;->E0:I

    .line 5
    iget p2, p1, Lb/f/b/k/h;->F0:I

    iput p2, p0, Lb/f/b/k/h;->F0:I

    .line 6
    iget p1, p1, Lb/f/b/k/h;->H0:I

    invoke-virtual {p0, p1}, Lb/f/b/k/h;->v(I)V

    return-void
.end method

.method public c(Lb/f/b/d;)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    iget-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Lb/f/b/d;->b(Ljava/lang/Object;)I

    move-result p1

    .line 3
    iget v0, p0, Lb/f/b/k/h;->H0:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_28

    .line 4
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->r(I)V

    .line 5
    invoke-virtual {p0, v2}, Lb/f/b/k/e;->s(I)V

    .line 6
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result p1

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->i(I)V

    .line 7
    invoke-virtual {p0, v2}, Lb/f/b/k/e;->q(I)V

    goto :goto_3c

    .line 8
    :cond_28
    invoke-virtual {p0, v2}, Lb/f/b/k/e;->r(I)V

    .line 9
    invoke-virtual {p0, p1}, Lb/f/b/k/e;->s(I)V

    .line 10
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p1

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result p1

    invoke-virtual {p0, p1}, Lb/f/b/k/e;->q(I)V

    .line 11
    invoke-virtual {p0, v2}, Lb/f/b/k/e;->i(I)V

    :goto_3c
    return-void
.end method

.method public d()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public e(F)V
    .registers 3

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_d

    .line 1
    iput p1, p0, Lb/f/b/k/h;->D0:F

    const/4 p1, -0x1

    .line 2
    iput p1, p0, Lb/f/b/k/h;->E0:I

    .line 3
    iput p1, p0, Lb/f/b/k/h;->F0:I

    :cond_d
    return-void
.end method

.method public t(I)V
    .registers 4

    const/4 v0, -0x1

    if-le p1, v0, :cond_b

    const/high16 v1, -0x40800000    # -1.0f

    .line 1
    iput v1, p0, Lb/f/b/k/h;->D0:F

    .line 2
    iput p1, p0, Lb/f/b/k/h;->E0:I

    .line 3
    iput v0, p0, Lb/f/b/k/h;->F0:I

    :cond_b
    return-void
.end method

.method public u(I)V
    .registers 4

    const/4 v0, -0x1

    if-le p1, v0, :cond_b

    const/high16 v1, -0x40800000    # -1.0f

    .line 1
    iput v1, p0, Lb/f/b/k/h;->D0:F

    .line 2
    iput v0, p0, Lb/f/b/k/h;->E0:I

    .line 3
    iput p1, p0, Lb/f/b/k/h;->F0:I

    :cond_b
    return-void
.end method

.method public v(I)V
    .registers 5

    .line 1
    iget v0, p0, Lb/f/b/k/h;->H0:I

    if-ne v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Lb/f/b/k/h;->H0:I

    .line 3
    iget-object p1, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 4
    iget p1, p0, Lb/f/b/k/h;->H0:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_16

    .line 5
    iget-object p1, p0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iput-object p1, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    goto :goto_1a

    .line 6
    :cond_16
    iget-object p1, p0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iput-object p1, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    .line 7
    :goto_1a
    iget-object p1, p0, Lb/f/b/k/e;->J:Ljava/util/ArrayList;

    iget-object v0, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    iget-object p1, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    array-length p1, p1

    const/4 v0, 0x0

    :goto_25
    if-ge v0, p1, :cond_30

    .line 9
    iget-object v1, p0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    iget-object v2, p0, Lb/f/b/k/h;->G0:Lb/f/b/k/d;

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_30
    return-void
.end method
