.class public final Lb/p/d/e$a;
.super Ljava/lang/Object;
.source "GapWorker.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lb/p/d/e$c;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/p/d/e$c;Lb/p/d/e$c;)I
    .registers 8

    .line 1
    iget-object v0, p1, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    iget-object v3, p2, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v3, :cond_f

    const/4 v3, 0x1

    goto :goto_10

    :cond_f
    const/4 v3, 0x0

    :goto_10
    const/4 v4, -0x1

    if-eq v0, v3, :cond_1a

    .line 2
    iget-object p1, p1, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p1, :cond_18

    goto :goto_19

    :cond_18
    const/4 v2, -0x1

    :goto_19
    return v2

    .line 3
    :cond_1a
    iget-boolean v0, p1, Lb/p/d/e$c;->a:Z

    iget-boolean v3, p2, Lb/p/d/e$c;->a:Z

    if-eq v0, v3, :cond_24

    if-eqz v0, :cond_23

    const/4 v2, -0x1

    :cond_23
    return v2

    .line 4
    :cond_24
    iget v0, p2, Lb/p/d/e$c;->b:I

    iget v2, p1, Lb/p/d/e$c;->b:I

    sub-int/2addr v0, v2

    if-eqz v0, :cond_2c

    return v0

    .line 5
    :cond_2c
    iget p1, p1, Lb/p/d/e$c;->c:I

    iget p2, p2, Lb/p/d/e$c;->c:I

    sub-int/2addr p1, p2

    if-eqz p1, :cond_34

    return p1

    :cond_34
    return v1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Lb/p/d/e$c;

    check-cast p2, Lb/p/d/e$c;

    invoke-virtual {p0, p1, p2}, Lb/p/d/e$a;->a(Lb/p/d/e$c;Lb/p/d/e$c;)I

    move-result p1

    return p1
.end method
