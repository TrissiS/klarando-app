.class public Lc/a/b/i/b/d$a;
.super Ljava/lang/Object;
.source "HighLevelEncoder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/b/i/b/d;->a()Lc/a/b/j/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lc/a/b/i/b/f;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lc/a/b/i/b/d;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/a/b/i/b/f;Lc/a/b/i/b/f;)I
    .registers 3

    .line 1
    invoke-virtual {p1}, Lc/a/b/i/b/f;->b()I

    move-result p1

    invoke-virtual {p2}, Lc/a/b/i/b/f;->b()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Lc/a/b/i/b/f;

    check-cast p2, Lc/a/b/i/b/f;

    invoke-virtual {p0, p1, p2}, Lc/a/b/i/b/d$a;->a(Lc/a/b/i/b/f;Lc/a/b/i/b/f;)I

    move-result p1

    return p1
.end method
