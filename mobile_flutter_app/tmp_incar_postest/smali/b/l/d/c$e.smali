.class public Lb/l/d/c$e;
.super Lb/l/d/e;
.source "DialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/c;->e()Lb/l/d/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/l/d/e;

.field public final synthetic b:Lb/l/d/c;


# direct methods
.method public constructor <init>(Lb/l/d/c;Lb/l/d/e;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/l/d/c$e;->b:Lb/l/d/c;

    iput-object p2, p0, Lb/l/d/c$e;->a:Lb/l/d/e;

    invoke-direct {p0}, Lb/l/d/e;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)Landroid/view/View;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/c$e;->a:Lb/l/d/e;

    invoke-virtual {v0}, Lb/l/d/e;->e()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    iget-object v0, p0, Lb/l/d/c$e;->a:Lb/l/d/e;

    invoke-virtual {v0, p1}, Lb/l/d/e;->a(I)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 3
    :cond_f
    iget-object v0, p0, Lb/l/d/c$e;->b:Lb/l/d/c;

    invoke-virtual {v0, p1}, Lb/l/d/c;->c(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/c$e;->a:Lb/l/d/e;

    invoke-virtual {v0}, Lb/l/d/e;->e()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Lb/l/d/c$e;->b:Lb/l/d/c;

    invoke-virtual {v0}, Lb/l/d/c;->A0()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_13

    :cond_11
    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v0, 0x1

    :goto_14
    return v0
.end method
