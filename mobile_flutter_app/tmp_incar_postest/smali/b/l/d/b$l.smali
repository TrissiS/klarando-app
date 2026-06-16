.class public Lb/l/d/b$l;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation


# instance fields
.field public final a:Lb/l/d/w$e;

.field public final b:Lb/h/i/b;


# direct methods
.method public constructor <init>(Lb/l/d/w$e;Lb/h/i/b;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/l/d/b$l;->a:Lb/l/d/w$e;

    .line 3
    iput-object p2, p0, Lb/l/d/b$l;->b:Lb/h/i/b;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/b$l;->a:Lb/l/d/w$e;

    iget-object v1, p0, Lb/l/d/b$l;->b:Lb/h/i/b;

    invoke-virtual {v0, v1}, Lb/l/d/w$e;->a(Lb/h/i/b;)V

    return-void
.end method

.method public b()Lb/l/d/w$e;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/b$l;->a:Lb/l/d/w$e;

    return-object v0
.end method

.method public c()Lb/h/i/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/b$l;->b:Lb/h/i/b;

    return-object v0
.end method

.method public d()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/b$l;->a:Lb/l/d/w$e;

    .line 2
    invoke-virtual {v0}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 3
    invoke-static {v0}, Lb/l/d/w$e$c;->from(Landroid/view/View;)Lb/l/d/w$e$c;

    move-result-object v0

    .line 4
    iget-object v1, p0, Lb/l/d/b$l;->a:Lb/l/d/w$e;

    invoke-virtual {v1}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v1

    if-eq v0, v1, :cond_1d

    .line 5
    sget-object v2, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    if-eq v0, v2, :cond_1b

    if-eq v1, v2, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 v0, 0x1

    :goto_1e
    return v0
.end method
