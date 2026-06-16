.class public Lb/p/d/h;
.super Ljava/lang/Object;
.source "OpReorderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/p/d/h$a;
    }
.end annotation


# instance fields
.field public final a:Lb/p/d/h$a;


# direct methods
.method public constructor <init>(Lb/p/d/h$a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;)I"
        }
    .end annotation

    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    :goto_7
    if-ltz v0, :cond_1c

    .line 17
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/p/d/a$b;

    .line 18
    iget v3, v3, Lb/p/d/a$b;->a:I

    const/16 v4, 0x8

    if-ne v3, v4, :cond_18

    if-eqz v2, :cond_19

    return v0

    :cond_18
    const/4 v2, 0x1

    :cond_19
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    :cond_1c
    const/4 p1, -0x1

    return p1
.end method

.method public final a(Ljava/util/List;II)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lb/p/d/a$b;

    .line 2
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lb/p/d/a$b;

    .line 3
    iget v0, v6, Lb/p/d/a$b;->a:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2a

    const/4 v1, 0x2

    if-eq v0, v1, :cond_22

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1a

    goto :goto_31

    :cond_1a
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v5, p3

    .line 4
    invoke-virtual/range {v1 .. v6}, Lb/p/d/h;->c(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V

    goto :goto_31

    :cond_22
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v5, p3

    .line 5
    invoke-virtual/range {v1 .. v6}, Lb/p/d/h;->b(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V

    goto :goto_31

    :cond_2a
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v5, p3

    .line 6
    invoke-virtual/range {v1 .. v6}, Lb/p/d/h;->a(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V

    :goto_31
    return-void
.end method

.method public final a(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;I",
            "Lb/p/d/a$b;",
            "I",
            "Lb/p/d/a$b;",
            ")V"
        }
    .end annotation

    .line 7
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    if-ge v0, v1, :cond_8

    const/4 v0, -0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    .line 8
    :goto_9
    iget v1, p3, Lb/p/d/a$b;->b:I

    iget v2, p5, Lb/p/d/a$b;->b:I

    if-ge v1, v2, :cond_11

    add-int/lit8 v0, v0, 0x1

    .line 9
    :cond_11
    iget v1, p5, Lb/p/d/a$b;->b:I

    iget v2, p3, Lb/p/d/a$b;->b:I

    if-gt v1, v2, :cond_1c

    .line 10
    iget v1, p5, Lb/p/d/a$b;->d:I

    add-int/2addr v2, v1

    iput v2, p3, Lb/p/d/a$b;->b:I

    .line 11
    :cond_1c
    iget v1, p5, Lb/p/d/a$b;->b:I

    iget v2, p3, Lb/p/d/a$b;->d:I

    if-gt v1, v2, :cond_27

    .line 12
    iget v1, p5, Lb/p/d/a$b;->d:I

    add-int/2addr v2, v1

    iput v2, p3, Lb/p/d/a$b;->d:I

    .line 13
    :cond_27
    iget v1, p5, Lb/p/d/a$b;->b:I

    add-int/2addr v1, v0

    iput v1, p5, Lb/p/d/a$b;->b:I

    .line 14
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 15
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public b(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    :goto_0
    invoke-virtual {p0, p1}, Lb/p/d/h;->a(Ljava/util/List;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_d

    add-int/lit8 v1, v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0, v1}, Lb/p/d/h;->a(Ljava/util/List;II)V

    goto :goto_0

    :cond_d
    return-void
.end method

.method public b(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;I",
            "Lb/p/d/a$b;",
            "I",
            "Lb/p/d/a$b;",
            ")V"
        }
    .end annotation

    .line 3
    iget v0, p3, Lb/p/d/a$b;->b:I

    iget v1, p3, Lb/p/d/a$b;->d:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v0, v1, :cond_15

    .line 4
    iget v4, p5, Lb/p/d/a$b;->b:I

    if-ne v4, v0, :cond_13

    iget v4, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v1, v0

    if-ne v4, v1, :cond_13

    const/4 v0, 0x0

    goto :goto_21

    :cond_13
    const/4 v0, 0x0

    goto :goto_24

    .line 5
    :cond_15
    iget v4, p5, Lb/p/d/a$b;->b:I

    add-int/lit8 v5, v1, 0x1

    if-ne v4, v5, :cond_23

    iget v4, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    if-ne v4, v0, :cond_23

    const/4 v0, 0x1

    :goto_21
    const/4 v2, 0x1

    goto :goto_24

    :cond_23
    const/4 v0, 0x1

    .line 6
    :goto_24
    iget v1, p3, Lb/p/d/a$b;->d:I

    iget v4, p5, Lb/p/d/a$b;->b:I

    const/4 v5, 0x2

    if-ge v1, v4, :cond_2f

    sub-int/2addr v4, v3

    .line 7
    iput v4, p5, Lb/p/d/a$b;->b:I

    goto :goto_48

    .line 8
    :cond_2f
    iget v6, p5, Lb/p/d/a$b;->d:I

    add-int/2addr v4, v6

    if-ge v1, v4, :cond_48

    sub-int/2addr v6, v3

    .line 9
    iput v6, p5, Lb/p/d/a$b;->d:I

    .line 10
    iput v5, p3, Lb/p/d/a$b;->a:I

    .line 11
    iput v3, p3, Lb/p/d/a$b;->d:I

    .line 12
    iget p2, p5, Lb/p/d/a$b;->d:I

    if-nez p2, :cond_47

    .line 13
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 14
    iget-object p1, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    invoke-interface {p1, p5}, Lb/p/d/h$a;->a(Lb/p/d/a$b;)V

    :cond_47
    return-void

    .line 15
    :cond_48
    :goto_48
    iget v1, p3, Lb/p/d/a$b;->b:I

    iget v4, p5, Lb/p/d/a$b;->b:I

    const/4 v6, 0x0

    if-gt v1, v4, :cond_53

    add-int/2addr v4, v3

    .line 16
    iput v4, p5, Lb/p/d/a$b;->b:I

    goto :goto_69

    .line 17
    :cond_53
    iget v7, p5, Lb/p/d/a$b;->d:I

    add-int v8, v4, v7

    if-ge v1, v8, :cond_69

    add-int/2addr v4, v7

    sub-int/2addr v4, v1

    .line 18
    iget-object v7, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    add-int/2addr v1, v3

    invoke-interface {v7, v5, v1, v4, v6}, Lb/p/d/h$a;->a(IIILjava/lang/Object;)Lb/p/d/a$b;

    move-result-object v6

    .line 19
    iget v1, p3, Lb/p/d/a$b;->b:I

    iget v3, p5, Lb/p/d/a$b;->b:I

    sub-int/2addr v1, v3

    iput v1, p5, Lb/p/d/a$b;->d:I

    :cond_69
    :goto_69
    if-eqz v2, :cond_77

    .line 20
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 21
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 22
    iget-object p1, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    invoke-interface {p1, p3}, Lb/p/d/h$a;->a(Lb/p/d/a$b;)V

    return-void

    :cond_77
    if-eqz v0, :cond_a8

    if-eqz v6, :cond_91

    .line 23
    iget v0, p3, Lb/p/d/a$b;->b:I

    iget v1, v6, Lb/p/d/a$b;->b:I

    if-le v0, v1, :cond_86

    .line 24
    iget v1, v6, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->b:I

    .line 25
    :cond_86
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, v6, Lb/p/d/a$b;->b:I

    if-le v0, v1, :cond_91

    .line 26
    iget v1, v6, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->d:I

    .line 27
    :cond_91
    iget v0, p3, Lb/p/d/a$b;->b:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    if-le v0, v1, :cond_9c

    .line 28
    iget v1, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->b:I

    .line 29
    :cond_9c
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    if-le v0, v1, :cond_d6

    .line 30
    iget v1, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->d:I

    goto :goto_d6

    :cond_a8
    if-eqz v6, :cond_c0

    .line 31
    iget v0, p3, Lb/p/d/a$b;->b:I

    iget v1, v6, Lb/p/d/a$b;->b:I

    if-lt v0, v1, :cond_b5

    .line 32
    iget v1, v6, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->b:I

    .line 33
    :cond_b5
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, v6, Lb/p/d/a$b;->b:I

    if-lt v0, v1, :cond_c0

    .line 34
    iget v1, v6, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->d:I

    .line 35
    :cond_c0
    iget v0, p3, Lb/p/d/a$b;->b:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    if-lt v0, v1, :cond_cb

    .line 36
    iget v1, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->b:I

    .line 37
    :cond_cb
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    if-lt v0, v1, :cond_d6

    .line 38
    iget v1, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v0, v1

    iput v0, p3, Lb/p/d/a$b;->d:I

    .line 39
    :cond_d6
    :goto_d6
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 40
    iget p5, p3, Lb/p/d/a$b;->b:I

    iget v0, p3, Lb/p/d/a$b;->d:I

    if-eq p5, v0, :cond_e3

    .line 41
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_e6

    .line 42
    :cond_e3
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :goto_e6
    if-eqz v6, :cond_eb

    .line 43
    invoke-interface {p1, p2, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_eb
    return-void
.end method

.method public c(Ljava/util/List;ILb/p/d/a$b;ILb/p/d/a$b;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/p/d/a$b;",
            ">;I",
            "Lb/p/d/a$b;",
            "I",
            "Lb/p/d/a$b;",
            ")V"
        }
    .end annotation

    .line 1
    iget v0, p3, Lb/p/d/a$b;->d:I

    iget v1, p5, Lb/p/d/a$b;->b:I

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v0, v1, :cond_d

    sub-int/2addr v1, v4

    .line 2
    iput v1, p5, Lb/p/d/a$b;->b:I

    goto :goto_20

    .line 3
    :cond_d
    iget v5, p5, Lb/p/d/a$b;->d:I

    add-int/2addr v1, v5

    if-ge v0, v1, :cond_20

    sub-int/2addr v5, v4

    .line 4
    iput v5, p5, Lb/p/d/a$b;->d:I

    .line 5
    iget-object v0, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    iget v1, p3, Lb/p/d/a$b;->b:I

    iget-object v5, p5, Lb/p/d/a$b;->c:Ljava/lang/Object;

    invoke-interface {v0, v2, v1, v4, v5}, Lb/p/d/h$a;->a(IIILjava/lang/Object;)Lb/p/d/a$b;

    move-result-object v0

    goto :goto_21

    :cond_20
    :goto_20
    move-object v0, v3

    .line 6
    :goto_21
    iget v1, p3, Lb/p/d/a$b;->b:I

    iget v5, p5, Lb/p/d/a$b;->b:I

    if-gt v1, v5, :cond_2b

    add-int/2addr v5, v4

    .line 7
    iput v5, p5, Lb/p/d/a$b;->b:I

    goto :goto_41

    .line 8
    :cond_2b
    iget v6, p5, Lb/p/d/a$b;->d:I

    add-int v7, v5, v6

    if-ge v1, v7, :cond_41

    add-int/2addr v5, v6

    sub-int/2addr v5, v1

    .line 9
    iget-object v3, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    add-int/2addr v1, v4

    iget-object v4, p5, Lb/p/d/a$b;->c:Ljava/lang/Object;

    invoke-interface {v3, v2, v1, v5, v4}, Lb/p/d/h$a;->a(IIILjava/lang/Object;)Lb/p/d/a$b;

    move-result-object v3

    .line 10
    iget v1, p5, Lb/p/d/a$b;->d:I

    sub-int/2addr v1, v5

    iput v1, p5, Lb/p/d/a$b;->d:I

    .line 11
    :cond_41
    :goto_41
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 12
    iget p3, p5, Lb/p/d/a$b;->d:I

    if-lez p3, :cond_4c

    .line 13
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_54

    .line 14
    :cond_4c
    invoke-interface {p1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 15
    iget-object p3, p0, Lb/p/d/h;->a:Lb/p/d/h$a;

    invoke-interface {p3, p5}, Lb/p/d/h$a;->a(Lb/p/d/a$b;)V

    :goto_54
    if-eqz v0, :cond_59

    .line 16
    invoke-interface {p1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_59
    if-eqz v3, :cond_5e

    .line 17
    invoke-interface {p1, p2, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_5e
    return-void
.end method
