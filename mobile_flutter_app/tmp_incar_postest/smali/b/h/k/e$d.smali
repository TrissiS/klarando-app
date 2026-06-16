.class public abstract Lb/h/k/e$d;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"

# interfaces
.implements Lb/h/k/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "d"
.end annotation


# instance fields
.field public final a:Lb/h/k/e$c;


# direct methods
.method public constructor <init>(Lb/h/k/e$c;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/k/e$d;->a:Lb/h/k/e$c;

    return-void
.end method


# virtual methods
.method public abstract a()Z
.end method

.method public a(Ljava/lang/CharSequence;II)Z
    .registers 5

    if-eqz p1, :cond_1b

    if-ltz p2, :cond_1b

    if-ltz p3, :cond_1b

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, p3

    if-lt v0, p2, :cond_1b

    .line 2
    iget-object v0, p0, Lb/h/k/e$d;->a:Lb/h/k/e$c;

    if-nez v0, :cond_16

    .line 3
    invoke-virtual {p0}, Lb/h/k/e$d;->a()Z

    move-result p1

    return p1

    .line 4
    :cond_16
    invoke-virtual {p0, p1, p2, p3}, Lb/h/k/e$d;->b(Ljava/lang/CharSequence;II)Z

    move-result p1

    return p1

    .line 5
    :cond_1b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public final b(Ljava/lang/CharSequence;II)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/k/e$d;->a:Lb/h/k/e$c;

    invoke-interface {v0, p1, p2, p3}, Lb/h/k/e$c;->a(Ljava/lang/CharSequence;II)I

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_12

    if-eq p1, p2, :cond_10

    .line 2
    invoke-virtual {p0}, Lb/h/k/e$d;->a()Z

    move-result p1

    return p1

    :cond_10
    const/4 p1, 0x0

    return p1

    :cond_12
    return p2
.end method
