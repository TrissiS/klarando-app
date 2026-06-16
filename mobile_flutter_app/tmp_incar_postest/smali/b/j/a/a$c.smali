.class public Lb/j/a/a$c;
.super Lb/h/m/h0/d;
.source "ExploreByTouchHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/j/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic b:Lb/j/a/a;


# direct methods
.method public constructor <init>(Lb/j/a/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/j/a/a$c;->b:Lb/j/a/a;

    invoke-direct {p0}, Lb/h/m/h0/d;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Lb/h/m/h0/c;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/j/a/a$c;->b:Lb/j/a/a;

    .line 2
    invoke-virtual {v0, p1}, Lb/j/a/a;->f(I)Lb/h/m/h0/c;

    move-result-object p1

    .line 3
    invoke-static {p1}, Lb/h/m/h0/c;->a(Lb/h/m/h0/c;)Lb/h/m/h0/c;

    move-result-object p1

    return-object p1
.end method

.method public a(IILandroid/os/Bundle;)Z
    .registers 5

    .line 4
    iget-object v0, p0, Lb/j/a/a$c;->b:Lb/j/a/a;

    invoke-virtual {v0, p1, p2, p3}, Lb/j/a/a;->b(IILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public b(I)Lb/h/m/h0/c;
    .registers 3

    const/4 v0, 0x2

    if-ne p1, v0, :cond_8

    .line 1
    iget-object p1, p0, Lb/j/a/a$c;->b:Lb/j/a/a;

    iget p1, p1, Lb/j/a/a;->k:I

    goto :goto_c

    :cond_8
    iget-object p1, p0, Lb/j/a/a$c;->b:Lb/j/a/a;

    iget p1, p1, Lb/j/a/a;->l:I

    :goto_c
    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_12

    const/4 p1, 0x0

    return-object p1

    .line 2
    :cond_12
    invoke-virtual {p0, p1}, Lb/j/a/a$c;->a(I)Lb/h/m/h0/c;

    move-result-object p1

    return-object p1
.end method
