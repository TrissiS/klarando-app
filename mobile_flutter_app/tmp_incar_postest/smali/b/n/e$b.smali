.class public final enum Lb/n/e$b;
.super Ljava/lang/Enum;
.source "Lifecycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/n/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/n/e$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lb/n/e$b;

.field public static final enum ON_ANY:Lb/n/e$b;

.field public static final enum ON_CREATE:Lb/n/e$b;

.field public static final enum ON_DESTROY:Lb/n/e$b;

.field public static final enum ON_PAUSE:Lb/n/e$b;

.field public static final enum ON_RESUME:Lb/n/e$b;

.field public static final enum ON_START:Lb/n/e$b;

.field public static final enum ON_STOP:Lb/n/e$b;


# direct methods
.method public static constructor <clinit>()V
    .registers 10

    .line 1
    new-instance v0, Lb/n/e$b;

    const/4 v1, 0x0

    const-string v2, "ON_CREATE"

    invoke-direct {v0, v2, v1}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    .line 2
    new-instance v0, Lb/n/e$b;

    const/4 v2, 0x1

    const-string v3, "ON_START"

    invoke-direct {v0, v3, v2}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_START:Lb/n/e$b;

    .line 3
    new-instance v0, Lb/n/e$b;

    const/4 v3, 0x2

    const-string v4, "ON_RESUME"

    invoke-direct {v0, v4, v3}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    .line 4
    new-instance v0, Lb/n/e$b;

    const/4 v4, 0x3

    const-string v5, "ON_PAUSE"

    invoke-direct {v0, v5, v4}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    .line 5
    new-instance v0, Lb/n/e$b;

    const/4 v5, 0x4

    const-string v6, "ON_STOP"

    invoke-direct {v0, v6, v5}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    .line 6
    new-instance v0, Lb/n/e$b;

    const/4 v6, 0x5

    const-string v7, "ON_DESTROY"

    invoke-direct {v0, v7, v6}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    .line 7
    new-instance v0, Lb/n/e$b;

    const/4 v7, 0x6

    const-string v8, "ON_ANY"

    invoke-direct {v0, v8, v7}, Lb/n/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/n/e$b;->ON_ANY:Lb/n/e$b;

    const/4 v8, 0x7

    new-array v8, v8, [Lb/n/e$b;

    .line 8
    sget-object v9, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    aput-object v9, v8, v1

    sget-object v1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    aput-object v1, v8, v2

    sget-object v1, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    aput-object v1, v8, v3

    sget-object v1, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    aput-object v1, v8, v4

    sget-object v1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    aput-object v1, v8, v5

    sget-object v1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    aput-object v1, v8, v6

    aput-object v0, v8, v7

    sput-object v8, Lb/n/e$b;->$VALUES:[Lb/n/e$b;

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

.method public static downFrom(Lb/n/e$c;)Lb/n/e$b;
    .registers 2

    .line 1
    sget-object v0, Lb/n/e$a;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_19

    const/4 v0, 0x2

    if-eq p0, v0, :cond_16

    const/4 v0, 0x3

    if-eq p0, v0, :cond_13

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_13
    sget-object p0, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    return-object p0

    .line 3
    :cond_16
    sget-object p0, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    return-object p0

    .line 4
    :cond_19
    sget-object p0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    return-object p0
.end method

.method public static downTo(Lb/n/e$c;)Lb/n/e$b;
    .registers 2

    .line 1
    sget-object v0, Lb/n/e$a;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_19

    const/4 v0, 0x2

    if-eq p0, v0, :cond_16

    const/4 v0, 0x4

    if-eq p0, v0, :cond_13

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_13
    sget-object p0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    return-object p0

    .line 3
    :cond_16
    sget-object p0, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    return-object p0

    .line 4
    :cond_19
    sget-object p0, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    return-object p0
.end method

.method public static upFrom(Lb/n/e$c;)Lb/n/e$b;
    .registers 2

    .line 1
    sget-object v0, Lb/n/e$a;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_19

    const/4 v0, 0x2

    if-eq p0, v0, :cond_16

    const/4 v0, 0x5

    if-eq p0, v0, :cond_13

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_13
    sget-object p0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    return-object p0

    .line 3
    :cond_16
    sget-object p0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    return-object p0

    .line 4
    :cond_19
    sget-object p0, Lb/n/e$b;->ON_START:Lb/n/e$b;

    return-object p0
.end method

.method public static upTo(Lb/n/e$c;)Lb/n/e$b;
    .registers 2

    .line 1
    sget-object v0, Lb/n/e$a;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_19

    const/4 v0, 0x2

    if-eq p0, v0, :cond_16

    const/4 v0, 0x3

    if-eq p0, v0, :cond_13

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_13
    sget-object p0, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    return-object p0

    .line 3
    :cond_16
    sget-object p0, Lb/n/e$b;->ON_START:Lb/n/e$b;

    return-object p0

    .line 4
    :cond_19
    sget-object p0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lb/n/e$b;
    .registers 2

    .line 1
    const-class v0, Lb/n/e$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/n/e$b;

    return-object p0
.end method

.method public static values()[Lb/n/e$b;
    .registers 1

    .line 1
    sget-object v0, Lb/n/e$b;->$VALUES:[Lb/n/e$b;

    invoke-virtual {v0}, [Lb/n/e$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/n/e$b;

    return-object v0
.end method


# virtual methods
.method public getTargetState()Lb/n/e$c;
    .registers 4

    .line 1
    sget-object v0, Lb/n/e$a;->b:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    .line 2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " has no target state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3
    :pswitch_22
    sget-object v0, Lb/n/e$c;->DESTROYED:Lb/n/e$c;

    return-object v0

    .line 4
    :pswitch_25
    sget-object v0, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    return-object v0

    .line 5
    :pswitch_28
    sget-object v0, Lb/n/e$c;->STARTED:Lb/n/e$c;

    return-object v0

    .line 6
    :pswitch_2b
    sget-object v0, Lb/n/e$c;->CREATED:Lb/n/e$c;

    return-object v0

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_2b
        :pswitch_28
        :pswitch_28
        :pswitch_25
        :pswitch_22
    .end packed-switch
.end method
