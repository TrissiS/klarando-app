.class public Lb/l/d/b$b;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/util/List;

.field public final synthetic i:Lb/l/d/w$e;

.field public final synthetic j:Lb/l/d/b;


# direct methods
.method public constructor <init>(Lb/l/d/b;Ljava/util/List;Lb/l/d/w$e;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lb/l/d/b$b;->j:Lb/l/d/b;

    iput-object p2, p0, Lb/l/d/b$b;->h:Ljava/util/List;

    iput-object p3, p0, Lb/l/d/b$b;->i:Lb/l/d/w$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/b$b;->h:Ljava/util/List;

    iget-object v1, p0, Lb/l/d/b$b;->i:Lb/l/d/w$e;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 2
    iget-object v0, p0, Lb/l/d/b$b;->h:Ljava/util/List;

    iget-object v1, p0, Lb/l/d/b$b;->i:Lb/l/d/w$e;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 3
    iget-object v0, p0, Lb/l/d/b$b;->j:Lb/l/d/b;

    iget-object v1, p0, Lb/l/d/b$b;->i:Lb/l/d/w$e;

    invoke-virtual {v0, v1}, Lb/l/d/b;->a(Lb/l/d/w$e;)V

    :cond_18
    return-void
.end method
