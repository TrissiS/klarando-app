.class public final Lc/a/a/a/l0/j;
.super Lc/a/a/a/l0/f;
.source "OffsetEdgeTreatment.java"


# instance fields
.field public final a:Lc/a/a/a/l0/f;

.field public final b:F


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/f;F)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lc/a/a/a/l0/f;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/l0/j;->a:Lc/a/a/a/l0/f;

    .line 3
    iput p2, p0, Lc/a/a/a/l0/j;->b:F

    return-void
.end method


# virtual methods
.method public a(FFFLc/a/a/a/l0/o;)V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/j;->a:Lc/a/a/a/l0/f;

    iget v1, p0, Lc/a/a/a/l0/j;->b:F

    sub-float/2addr p2, v1

    invoke-virtual {v0, p1, p2, p3, p4}, Lc/a/a/a/l0/f;->a(FFFLc/a/a/a/l0/o;)V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/j;->a:Lc/a/a/a/l0/f;

    invoke-virtual {v0}, Lc/a/a/a/l0/f;->a()Z

    move-result v0

    return v0
.end method
