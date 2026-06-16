.class public Lb/l/d/b$i;
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
.field public final synthetic h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lb/l/d/b;Ljava/util/ArrayList;)V
    .registers 3

    .line 1
    iput-object p2, p0, Lb/l/d/b$i;->h:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/b$i;->h:Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lb/l/d/r;->a(Ljava/util/ArrayList;I)V

    return-void
.end method
