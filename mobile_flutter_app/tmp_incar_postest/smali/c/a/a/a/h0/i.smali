.class public abstract Lc/a/a/a/h0/i;
.super Ljava/lang/Object;
.source "IndeterminateAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/animation/Animator;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lc/a/a/a/h0/j;

.field public final b:[F

.field public final c:[I


# direct methods
.method public constructor <init>(I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    mul-int/lit8 v0, p1, 0x2

    .line 2
    new-array v0, v0, [F

    iput-object v0, p0, Lc/a/a/a/h0/i;->b:[F

    .line 3
    new-array p1, p1, [I

    iput-object p1, p0, Lc/a/a/a/h0/i;->c:[I

    return-void
.end method


# virtual methods
.method public a(III)F
    .registers 4

    sub-int/2addr p1, p2

    int-to-float p1, p1

    int-to-float p2, p3

    div-float/2addr p1, p2

    return p1
.end method

.method public abstract a()V
.end method

.method public abstract a(Lb/t/a/a/b$a;)V
.end method

.method public a(Lc/a/a/a/h0/j;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    return-void
.end method

.method public abstract b()V
.end method

.method public abstract c()V
.end method

.method public abstract d()V
.end method

.method public abstract e()V
.end method
