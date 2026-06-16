.class public Lb/f/b/h$a;
.super Ljava/lang/Object;
.source "PriorityGoalRow.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/f/b/h;->e(Lb/f/b/i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lb/f/b/i;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lb/f/b/h;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/f/b/i;Lb/f/b/i;)I
    .registers 3

    .line 1
    iget p1, p1, Lb/f/b/i;->c:I

    iget p2, p2, Lb/f/b/i;->c:I

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Lb/f/b/i;

    check-cast p2, Lb/f/b/i;

    invoke-virtual {p0, p1, p2}, Lb/f/b/h$a;->a(Lb/f/b/i;Lb/f/b/i;)I

    move-result p1

    return p1
.end method
