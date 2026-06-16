.class public abstract Lc/a/a/a/h0/h;
.super Ljava/lang/Object;
.source "DrawingDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lc/a/a/a/h0/c;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Lc/a/a/a/h0/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field public b:Lc/a/a/a/h0/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/c;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    return-void
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract a(Landroid/graphics/Canvas;F)V
.end method

.method public abstract a(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
.end method

.method public abstract a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFI)V
.end method

.method public a(Lc/a/a/a/h0/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    return-void
.end method

.method public abstract b()I
.end method

.method public b(Landroid/graphics/Canvas;F)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    invoke-virtual {v0}, Lc/a/a/a/h0/c;->c()V

    .line 2
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/h0/h;->a(Landroid/graphics/Canvas;F)V

    return-void
.end method
