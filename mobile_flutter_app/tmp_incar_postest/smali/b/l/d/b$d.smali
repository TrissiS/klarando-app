.class public Lb/l/d/b$d;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"

# interfaces
.implements Lb/h/i/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Lb/l/d/b;Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iput-object p2, p0, Lb/l/d/b$d;->a:Landroid/animation/Animator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/b$d;->a:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    return-void
.end method
