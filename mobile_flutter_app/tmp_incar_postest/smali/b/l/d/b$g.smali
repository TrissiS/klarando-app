.class public Lb/l/d/b$g;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLb/l/d/w$e;Lb/l/d/w$e;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/w$e;

.field public final synthetic i:Lb/l/d/w$e;

.field public final synthetic j:Z

.field public final synthetic k:Lb/e/a;


# direct methods
.method public constructor <init>(Lb/l/d/b;Lb/l/d/w$e;Lb/l/d/w$e;ZLb/e/a;)V
    .registers 6

    .line 1
    iput-object p2, p0, Lb/l/d/b$g;->h:Lb/l/d/w$e;

    iput-object p3, p0, Lb/l/d/b$g;->i:Lb/l/d/w$e;

    iput-boolean p4, p0, Lb/l/d/b$g;->j:Z

    iput-object p5, p0, Lb/l/d/b$g;->k:Lb/e/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/b$g;->h:Lb/l/d/w$e;

    .line 2
    invoke-virtual {v0}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget-object v1, p0, Lb/l/d/b$g;->i:Lb/l/d/w$e;

    invoke-virtual {v1}, Lb/l/d/w$e;->d()Landroidx/fragment/app/Fragment;

    move-result-object v1

    iget-boolean v2, p0, Lb/l/d/b$g;->j:Z

    iget-object v3, p0, Lb/l/d/b$g;->k:Lb/e/a;

    const/4 v4, 0x0

    .line 3
    invoke-static {v0, v1, v2, v3, v4}, Lb/l/d/r;->a(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;ZLb/e/a;Z)V

    return-void
.end method
