.class public final Lb/j/a/a$b;
.super Ljava/lang/Object;
.source "ExploreByTouchHelper.java"

# interfaces
.implements Lb/j/a/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/j/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/j/a/b$b<",
        "Lb/e/h<",
        "Lb/h/m/h0/c;",
        ">;",
        "Lb/h/m/h0/c;",
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
.method public a(Lb/e/h;)I
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/h<",
            "Lb/h/m/h0/c;",
            ">;)I"
        }
    .end annotation

    .line 4
    invoke-virtual {p1}, Lb/e/h;->c()I

    move-result p1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)I
    .registers 2

    .line 2
    check-cast p1, Lb/e/h;

    invoke-virtual {p0, p1}, Lb/j/a/a$b;->a(Lb/e/h;)I

    move-result p1

    return p1
.end method

.method public a(Lb/e/h;I)Lb/h/m/h0/c;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/h<",
            "Lb/h/m/h0/c;",
            ">;I)",
            "Lb/h/m/h0/c;"
        }
    .end annotation

    .line 3
    invoke-virtual {p1, p2}, Lb/e/h;->c(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/h/m/h0/c;

    return-object p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3

    .line 1
    check-cast p1, Lb/e/h;

    invoke-virtual {p0, p1, p2}, Lb/j/a/a$b;->a(Lb/e/h;I)Lb/h/m/h0/c;

    move-result-object p1

    return-object p1
.end method
