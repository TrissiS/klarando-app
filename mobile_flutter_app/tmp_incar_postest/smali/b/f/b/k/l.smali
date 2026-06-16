.class public Lb/f/b/k/l;
.super Lb/f/b/k/j;
.source "VirtualLayout.java"


# instance fields
.field public F0:I

.field public G0:I

.field public H0:I

.field public I0:I

.field public J0:I

.field public K0:I

.field public L0:Z

.field public M0:I

.field public N0:I

.field public O0:Lb/f/b/k/n/b$a;

.field public P0:Lb/f/b/k/n/b$b;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/b/k/j;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/b/k/l;->F0:I

    .line 3
    iput v0, p0, Lb/f/b/k/l;->G0:I

    .line 4
    iput v0, p0, Lb/f/b/k/l;->H0:I

    .line 5
    iput v0, p0, Lb/f/b/k/l;->I0:I

    .line 6
    iput v0, p0, Lb/f/b/k/l;->J0:I

    .line 7
    iput v0, p0, Lb/f/b/k/l;->K0:I

    .line 8
    iput-boolean v0, p0, Lb/f/b/k/l;->L0:Z

    .line 9
    iput v0, p0, Lb/f/b/k/l;->M0:I

    .line 10
    iput v0, p0, Lb/f/b/k/l;->N0:I

    .line 11
    new-instance v0, Lb/f/b/k/n/b$a;

    invoke-direct {v0}, Lb/f/b/k/n/b$a;-><init>()V

    iput-object v0, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lb/f/b/k/l;->P0:Lb/f/b/k/n/b$b;

    return-void
.end method


# virtual methods
.method public J()V
    .registers 4

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget v1, p0, Lb/f/b/k/j;->E0:I

    if-ge v0, v1, :cond_12

    .line 2
    iget-object v1, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v1, v1, v0

    if-eqz v1, :cond_f

    const/4 v2, 0x1

    .line 3
    invoke-virtual {v1, v2}, Lb/f/b/k/e;->c(Z)V

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_12
    return-void
.end method

.method public K()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->N0:I

    return v0
.end method

.method public L()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->M0:I

    return v0
.end method

.method public M()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->G0:I

    return v0
.end method

.method public N()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->J0:I

    return v0
.end method

.method public O()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->K0:I

    return v0
.end method

.method public P()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/k/l;->F0:I

    return v0
.end method

.method public Q()Z
    .registers 10

    .line 1
    iget-object v0, p0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    if-eqz v0, :cond_b

    .line 2
    check-cast v0, Lb/f/b/k/f;

    invoke-virtual {v0}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    const/4 v1, 0x0

    if-nez v0, :cond_10

    return v1

    :cond_10
    const/4 v2, 0x0

    .line 3
    :goto_11
    iget v3, p0, Lb/f/b/k/j;->E0:I

    const/4 v4, 0x1

    if-ge v2, v3, :cond_7a

    .line 4
    iget-object v3, p0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v3, v3, v2

    if-nez v3, :cond_1d

    goto :goto_77

    .line 5
    :cond_1d
    instance-of v5, v3, Lb/f/b/k/h;

    if-eqz v5, :cond_22

    goto :goto_77

    .line 6
    :cond_22
    invoke-virtual {v3, v1}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v5

    .line 7
    invoke-virtual {v3, v4}, Lb/f/b/k/e;->b(I)Lb/f/b/k/e$b;

    move-result-object v6

    .line 8
    sget-object v7, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v5, v7, :cond_39

    iget v8, v3, Lb/f/b/k/e;->j:I

    if-eq v8, v4, :cond_39

    if-ne v6, v7, :cond_39

    iget v7, v3, Lb/f/b/k/e;->k:I

    if-eq v7, v4, :cond_39

    goto :goto_3a

    :cond_39
    const/4 v4, 0x0

    :goto_3a
    if-eqz v4, :cond_3d

    goto :goto_77

    .line 9
    :cond_3d
    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v5, v4, :cond_43

    .line 10
    sget-object v5, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    .line 11
    :cond_43
    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v6, v4, :cond_49

    .line 12
    sget-object v6, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    .line 13
    :cond_49
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iput-object v5, v4, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    .line 14
    iput-object v6, v4, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 15
    invoke-virtual {v3}, Lb/f/b/k/e;->A()I

    move-result v5

    iput v5, v4, Lb/f/b/k/n/b$a;->c:I

    .line 16
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    invoke-virtual {v3}, Lb/f/b/k/e;->k()I

    move-result v5

    iput v5, v4, Lb/f/b/k/n/b$a;->d:I

    .line 17
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    invoke-interface {v0, v3, v4}, Lb/f/b/k/n/b$b;->a(Lb/f/b/k/e;Lb/f/b/k/n/b$a;)V

    .line 18
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget v4, v4, Lb/f/b/k/n/b$a;->e:I

    invoke-virtual {v3, v4}, Lb/f/b/k/e;->q(I)V

    .line 19
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget v4, v4, Lb/f/b/k/n/b$a;->f:I

    invoke-virtual {v3, v4}, Lb/f/b/k/e;->i(I)V

    .line 20
    iget-object v4, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget v4, v4, Lb/f/b/k/n/b$a;->g:I

    invoke-virtual {v3, v4}, Lb/f/b/k/e;->h(I)V

    :goto_77
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    :cond_7a
    return v4
.end method

.method public R()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/l;->L0:Z

    return v0
.end method

.method public a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V
    .registers 7

    .line 2
    :goto_0
    iget-object v0, p0, Lb/f/b/k/l;->P0:Lb/f/b/k/n/b$b;

    if-nez v0, :cond_17

    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 3
    invoke-virtual {p0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    check-cast v0, Lb/f/b/k/f;

    .line 4
    invoke-virtual {v0}, Lb/f/b/k/f;->M()Lb/f/b/k/n/b$b;

    move-result-object v0

    iput-object v0, p0, Lb/f/b/k/l;->P0:Lb/f/b/k/n/b$b;

    goto :goto_0

    .line 5
    :cond_17
    iget-object v0, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iput-object p2, v0, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    .line 6
    iput-object p4, v0, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 7
    iput p3, v0, Lb/f/b/k/n/b$a;->c:I

    .line 8
    iput p5, v0, Lb/f/b/k/n/b$a;->d:I

    .line 9
    iget-object p2, p0, Lb/f/b/k/l;->P0:Lb/f/b/k/n/b$b;

    invoke-interface {p2, p1, v0}, Lb/f/b/k/n/b$b;->a(Lb/f/b/k/e;Lb/f/b/k/n/b$a;)V

    .line 10
    iget-object p2, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->e:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->q(I)V

    .line 11
    iget-object p2, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->f:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->i(I)V

    .line 12
    iget-object p2, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget-boolean p2, p2, Lb/f/b/k/n/b$a;->h:Z

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->a(Z)V

    .line 13
    iget-object p2, p0, Lb/f/b/k/l;->O0:Lb/f/b/k/n/b$a;

    iget p2, p2, Lb/f/b/k/n/b$a;->g:I

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->h(I)V

    return-void
.end method

.method public a(Lb/f/b/k/f;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/f/b/k/l;->J()V

    return-void
.end method

.method public b(IIII)V
    .registers 5

    return-void
.end method

.method public d(II)V
    .registers 3

    .line 6
    iput p1, p0, Lb/f/b/k/l;->M0:I

    .line 7
    iput p2, p0, Lb/f/b/k/l;->N0:I

    return-void
.end method

.method public d(Z)V
    .registers 3

    .line 1
    iget v0, p0, Lb/f/b/k/l;->H0:I

    if-gtz v0, :cond_8

    iget v0, p0, Lb/f/b/k/l;->I0:I

    if-lez v0, :cond_1b

    :cond_8
    if-eqz p1, :cond_13

    .line 2
    iget p1, p0, Lb/f/b/k/l;->I0:I

    iput p1, p0, Lb/f/b/k/l;->J0:I

    .line 3
    iget p1, p0, Lb/f/b/k/l;->H0:I

    iput p1, p0, Lb/f/b/k/l;->K0:I

    goto :goto_1b

    .line 4
    :cond_13
    iget p1, p0, Lb/f/b/k/l;->H0:I

    iput p1, p0, Lb/f/b/k/l;->J0:I

    .line 5
    iget p1, p0, Lb/f/b/k/l;->I0:I

    iput p1, p0, Lb/f/b/k/l;->K0:I

    :cond_1b
    :goto_1b
    return-void
.end method

.method public e(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/f/b/k/l;->L0:Z

    return-void
.end method

.method public t(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->F0:I

    .line 2
    iput p1, p0, Lb/f/b/k/l;->G0:I

    .line 3
    iput p1, p0, Lb/f/b/k/l;->H0:I

    .line 4
    iput p1, p0, Lb/f/b/k/l;->I0:I

    return-void
.end method

.method public u(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->G0:I

    return-void
.end method

.method public v(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->I0:I

    return-void
.end method

.method public w(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->J0:I

    return-void
.end method

.method public x(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->K0:I

    return-void
.end method

.method public y(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->H0:I

    .line 2
    iput p1, p0, Lb/f/b/k/l;->J0:I

    .line 3
    iput p1, p0, Lb/f/b/k/l;->K0:I

    return-void
.end method

.method public z(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/l;->F0:I

    return-void
.end method
