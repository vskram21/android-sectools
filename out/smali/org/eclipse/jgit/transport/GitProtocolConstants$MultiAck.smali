.class final enum Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
.super Ljava/lang/Enum;
.source "GitProtocolConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/GitProtocolConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "MultiAck"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

.field public static final enum CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

.field public static final enum DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

.field public static final enum OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 161
    new-instance v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    const-string v1, "OFF"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    new-instance v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    const-string v1, "CONTINUE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    new-instance v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    const-string v1, "DETAILED"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 160
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->$VALUES:[Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 160
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
    .locals 1
    .parameter "name"

    .prologue
    .line 160
    const-class v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
    .locals 1

    .prologue
    .line 160
    sget-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->$VALUES:[Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    return-object v0
.end method
