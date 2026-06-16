.class public Lb/f/b/k/k;
.super Ljava/lang/Object;
.source "Optimizer.java"


# static fields
.field public static a:[Z


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x3

    new-array v0, v0, [Z

    .line 1
    sput-object v0, Lb/f/b/k/k;->a:[Z

    return-void
.end method

.method public static a(Lb/f/b/k/f;Lb/f/b/d;Lb/f/b/k/e;)V
    .registers 8

    const/4 v0, -0x1

    .line 1
    iput v0, p2, Lb/f/b/k/e;->h:I

    .line 2
    iput v0, p2, Lb/f/b/k/e;->i:I

    .line 3
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    const/4 v3, 0x2

    if-eq v0, v2, :cond_47

    iget-object v0, p2, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v1

    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_47

    .line 4
    iget-object v0, p2, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget v0, v0, Lb/f/b/k/d;->e:I

    .line 5
    invoke-virtual {p0}, Lb/f/b/k/e;->A()I

    move-result v1

    iget-object v2, p2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget v2, v2, Lb/f/b/k/d;->e:I

    sub-int/2addr v1, v2

    .line 6
    iget-object v2, p2, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {p1, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v4

    iput-object v4, v2, Lb/f/b/k/d;->g:Lb/f/b/i;

    .line 7
    iget-object v2, p2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {p1, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v4

    iput-object v4, v2, Lb/f/b/k/d;->g:Lb/f/b/i;

    .line 8
    iget-object v2, p2, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v2, v2, Lb/f/b/k/d;->g:Lb/f/b/i;

    invoke-virtual {p1, v2, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 9
    iget-object v2, p2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v2, v2, Lb/f/b/k/d;->g:Lb/f/b/i;

    invoke-virtual {p1, v2, v1}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 10
    iput v3, p2, Lb/f/b/k/e;->h:I

    .line 11
    invoke-virtual {p2, v0, v1}, Lb/f/b/k/e;->a(II)V

    .line 12
    :cond_47
    iget-object v0, p0, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    sget-object v2, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    if-eq v0, v2, :cond_a6

    iget-object v0, p2, Lb/f/b/k/e;->L:[Lb/f/b/k/e$b;

    aget-object v0, v0, v1

    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_a6

    .line 13
    iget-object v0, p2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget v0, v0, Lb/f/b/k/d;->e:I

    .line 14
    invoke-virtual {p0}, Lb/f/b/k/e;->k()I

    move-result p0

    iget-object v1, p2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v1, v1, Lb/f/b/k/d;->e:I

    sub-int/2addr p0, v1

    .line 15
    iget-object v1, p2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {p1, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v2

    iput-object v2, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    .line 16
    iget-object v1, p2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p1, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v2

    iput-object v2, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    .line 17
    iget-object v1, p2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    invoke-virtual {p1, v1, v0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 18
    iget-object v1, p2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    invoke-virtual {p1, v1, p0}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 19
    iget v1, p2, Lb/f/b/k/e;->X:I

    if-gtz v1, :cond_8f

    invoke-virtual {p2}, Lb/f/b/k/e;->z()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_a1

    .line 20
    :cond_8f
    iget-object v1, p2, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {p1, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v2

    iput-object v2, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    .line 21
    iget-object v1, p2, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->g:Lb/f/b/i;

    iget v2, p2, Lb/f/b/k/e;->X:I

    add-int/2addr v2, v0

    invoke-virtual {p1, v1, v2}, Lb/f/b/d;->a(Lb/f/b/i;I)V

    .line 22
    :cond_a1
    iput v3, p2, Lb/f/b/k/e;->i:I

    .line 23
    invoke-virtual {p2, v0, p0}, Lb/f/b/k/e;->c(II)V

    :cond_a6
    return-void
.end method

.method public static final a(II)Z
    .registers 2

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_5

    const/4 p0, 0x1

    goto :goto_6

    :cond_5
    const/4 p0, 0x0

    :goto_6
    return p0
.end method
