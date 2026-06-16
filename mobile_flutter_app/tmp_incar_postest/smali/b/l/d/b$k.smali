.class public Lb/l/d/b$k;
.super Lb/l/d/b$l;
.source "DefaultSpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation


# instance fields
.field public c:Z

.field public d:Z

.field public e:Lb/l/d/d$d;


# direct methods
.method public constructor <init>(Lb/l/d/w$e;Lb/h/i/b;Z)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2}, Lb/l/d/b$l;-><init>(Lb/l/d/w$e;Lb/h/i/b;)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/l/d/b$k;->d:Z

    .line 3
    iput-boolean p3, p0, Lb/l/d/b$k;->c:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Lb/l/d/d$d;
    .registers 6

    .line 1
    iget-boolean v0, p0, Lb/l/d/b$k;->d:Z

    if-eqz v0, :cond_7

    .line 2
    iget-object p1, p0, Lb/l/d/b$k;->e:Lb/l/d/d$d;

    return-object p1

    .line 3
    :cond_7
    invoke-virtual {p0}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v0

    invoke-virtual {v0}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 4
    invoke-virtual {p0}, Lb/l/d/b$l;->b()Lb/l/d/w$e;

    move-result-object v1

    invoke-virtual {v1}, Lb/l/d/w$e;->c()Lb/l/d/w$e$c;

    move-result-object v1

    sget-object v2, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_1e

    const/4 v1, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v1, 0x0

    :goto_1f
    iget-boolean v2, p0, Lb/l/d/b$k;->c:Z

    .line 5
    invoke-static {p1, v0, v1, v2}, Lb/l/d/d;->a(Landroid/content/Context;Landroidx/fragment/app/Fragment;ZZ)Lb/l/d/d$d;

    move-result-object p1

    iput-object p1, p0, Lb/l/d/b$k;->e:Lb/l/d/d$d;

    .line 6
    iput-boolean v3, p0, Lb/l/d/b$k;->d:Z

    return-object p1
.end method
