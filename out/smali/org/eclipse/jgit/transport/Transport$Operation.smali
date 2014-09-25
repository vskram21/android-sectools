.class public final enum Lorg/eclipse/jgit/transport/Transport$Operation;
.super Ljava/lang/Enum;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/Transport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Operation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/Transport$Operation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/Transport$Operation;

.field public static final enum FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

.field public static final enum PUSH:Lorg/eclipse/jgit/transport/Transport$Operation;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 100
    new-instance v0, Lorg/eclipse/jgit/transport/Transport$Operation;

    const-string v1, "FETCH"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/Transport$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    .line 102
    new-instance v0, Lorg/eclipse/jgit/transport/Transport$Operation;

    const-string v1, "PUSH"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/Transport$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->PUSH:Lorg/eclipse/jgit/transport/Transport$Operation;

    .line 98
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/transport/Transport$Operation;

    sget-object v1, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/Transport$Operation;->PUSH:Lorg/eclipse/jgit/transport/Transport$Operation;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->$VALUES:[Lorg/eclipse/jgit/transport/Transport$Operation;

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
    .line 98
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport$Operation;
    .locals 1
    .parameter "name"

    .prologue
    .line 98
    const-class v0, Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/Transport$Operation;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/Transport$Operation;
    .locals 1

    .prologue
    .line 98
    sget-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->$VALUES:[Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/Transport$Operation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/Transport$Operation;

    return-object v0
.end method
