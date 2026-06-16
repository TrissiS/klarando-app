.class public Lb/f/a/b/g$c;
.super Lb/f/a/b/g;
.source "KeyCycleOscillator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public g:[F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/a/b/g;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [F

    .line 2
    iput-object v0, p0, Lb/f/a/b/g$c;->g:[F

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;F)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/a/b/g$c;->g:[F

    invoke-virtual {p0, p2}, Lb/f/a/b/g;->a(F)F

    move-result p2

    const/4 v1, 0x0

    aput p2, v0, v1

    .line 2
    iget-object p2, p0, Lb/f/a/b/g;->b:Lb/f/c/a;

    iget-object v0, p0, Lb/f/a/b/g$c;->g:[F

    invoke-virtual {p2, p1, v0}, Lb/f/c/a;->a(Landroid/view/View;[F)V

    return-void
.end method
