.class public Lb/f/a/b/g$a;
.super Ljava/lang/Object;
.source "KeyCycleOscillator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/f/a/b/g;->c(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lb/f/a/b/g$p;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lb/f/a/b/g;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/f/a/b/g$p;Lb/f/a/b/g$p;)I
    .registers 3

    .line 1
    iget p1, p1, Lb/f/a/b/g$p;->a:I

    iget p2, p2, Lb/f/a/b/g$p;->a:I

    invoke-static {p1, p2}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Lb/f/a/b/g$p;

    check-cast p2, Lb/f/a/b/g$p;

    invoke-virtual {p0, p1, p2}, Lb/f/a/b/g$a;->a(Lb/f/a/b/g$p;Lb/f/a/b/g$p;)I

    move-result p1

    return p1
.end method
