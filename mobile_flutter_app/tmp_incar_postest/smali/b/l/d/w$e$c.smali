.class public final enum Lb/l/d/w$e$c;
.super Ljava/lang/Enum;
.source "SpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/w$e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/l/d/w$e$c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum GONE:Lb/l/d/w$e$c;

.field public static final enum INVISIBLE:Lb/l/d/w$e$c;

.field public static final enum REMOVED:Lb/l/d/w$e$c;

.field public static final enum VISIBLE:Lb/l/d/w$e$c;

.field public static final synthetic h:[Lb/l/d/w$e$c;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    new-instance v0, Lb/l/d/w$e$c;

    const/4 v1, 0x0

    const-string v2, "REMOVED"

    invoke-direct {v0, v2, v1}, Lb/l/d/w$e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    .line 2
    new-instance v0, Lb/l/d/w$e$c;

    const/4 v2, 0x1

    const-string v3, "VISIBLE"

    invoke-direct {v0, v3, v2}, Lb/l/d/w$e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    .line 3
    new-instance v0, Lb/l/d/w$e$c;

    const/4 v3, 0x2

    const-string v4, "GONE"

    invoke-direct {v0, v4, v3}, Lb/l/d/w$e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    .line 4
    new-instance v0, Lb/l/d/w$e$c;

    const/4 v4, 0x3

    const-string v5, "INVISIBLE"

    invoke-direct {v0, v5, v4}, Lb/l/d/w$e$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$c;->INVISIBLE:Lb/l/d/w$e$c;

    const/4 v5, 0x4

    new-array v5, v5, [Lb/l/d/w$e$c;

    .line 5
    sget-object v6, Lb/l/d/w$e$c;->REMOVED:Lb/l/d/w$e$c;

    aput-object v6, v5, v1

    sget-object v1, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    aput-object v1, v5, v2

    sget-object v1, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lb/l/d/w$e$c;->h:[Lb/l/d/w$e$c;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static from(I)Lb/l/d/w$e$c;
    .registers 4

    if-eqz p0, :cond_26

    const/4 v0, 0x4

    if-eq p0, v0, :cond_23

    const/16 v0, 0x8

    if-ne p0, v0, :cond_c

    .line 4
    sget-object p0, Lb/l/d/w$e$c;->GONE:Lb/l/d/w$e$c;

    return-object p0

    .line 5
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown visibility "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 6
    :cond_23
    sget-object p0, Lb/l/d/w$e$c;->INVISIBLE:Lb/l/d/w$e$c;

    return-object p0

    .line 7
    :cond_26
    sget-object p0, Lb/l/d/w$e$c;->VISIBLE:Lb/l/d/w$e$c;

    return-object p0
.end method

.method public static from(Landroid/view/View;)Lb/l/d/w$e$c;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_12

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_12

    .line 2
    sget-object p0, Lb/l/d/w$e$c;->INVISIBLE:Lb/l/d/w$e$c;

    return-object p0

    .line 3
    :cond_12
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    invoke-static {p0}, Lb/l/d/w$e$c;->from(I)Lb/l/d/w$e$c;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lb/l/d/w$e$c;
    .registers 2

    .line 1
    const-class v0, Lb/l/d/w$e$c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/l/d/w$e$c;

    return-object p0
.end method

.method public static values()[Lb/l/d/w$e$c;
    .registers 1

    .line 1
    sget-object v0, Lb/l/d/w$e$c;->h:[Lb/l/d/w$e$c;

    invoke-virtual {v0}, [Lb/l/d/w$e$c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/l/d/w$e$c;

    return-object v0
.end method


# virtual methods
.method public applyState(Landroid/view/View;)V
    .registers 7

    .line 1
    sget-object v0, Lb/l/d/w$c;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const-string v2, "FragmentManager"

    const/4 v3, 0x2

    if-eq v0, v1, :cond_80

    const-string v1, "SpecialEffectsController: Setting view "

    if-eq v0, v3, :cond_5e

    const/4 v4, 0x3

    if-eq v0, v4, :cond_3b

    const/4 v4, 0x4

    if-eq v0, v4, :cond_1a

    goto/16 :goto_ad

    .line 2
    :cond_1a
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " to INVISIBLE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_37
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_ad

    .line 5
    :cond_3b
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " to GONE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_58
    const/16 v0, 0x8

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_ad

    .line 8
    :cond_5e
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " to VISIBLE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7b
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_ad

    .line 11
    :cond_80
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_ad

    .line 12
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v1

    if-eqz v1, :cond_aa

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SpecialEffectsController: Removing view "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " from container "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    :cond_aa
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_ad
    :goto_ad
    return-void
.end method
