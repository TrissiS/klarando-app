.class public Lc/c/d/l/b;
.super Ljava/lang/Object;
.source "LocationToastStyle.java"

# interfaces
.implements Lc/c/d/k/f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lc/c/d/k/f<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lc/c/d/k/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/c/d/k/f<",
            "*>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:F

.field public final f:F


# direct methods
.method public constructor <init>(Lc/c/d/k/f;IIIFF)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/c/d/k/f<",
            "*>;IIIFF)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/c/d/l/b;->a:Lc/c/d/k/f;

    .line 3
    iput p2, p0, Lc/c/d/l/b;->b:I

    .line 4
    iput p3, p0, Lc/c/d/l/b;->c:I

    .line 5
    iput p4, p0, Lc/c/d/l/b;->d:I

    .line 6
    iput p5, p0, Lc/c/d/l/b;->e:F

    .line 7
    iput p6, p0, Lc/c/d/l/b;->f:F

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroid/view/View;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/d/l/b;->a:Lc/c/d/k/f;

    invoke-interface {v0, p1}, Lc/c/d/k/f;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getGravity()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/l/b;->b:I

    return v0
.end method

.method public getHorizontalMargin()F
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/l/b;->e:F

    return v0
.end method

.method public getVerticalMargin()F
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/l/b;->f:F

    return v0
.end method

.method public getXOffset()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/l/b;->c:I

    return v0
.end method

.method public getYOffset()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/l/b;->d:I

    return v0
.end method
