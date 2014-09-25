.class public final enum Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
.super Ljava/lang/Enum;
.source "CoreConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/CoreConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SymLinks"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

.field public static final enum FALSE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

.field public static final enum TRUE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 111
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    const-string v1, "FALSE"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    .line 113
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    const-string v1, "TRUE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    .line 109
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

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
    .line 109
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    .locals 1
    .parameter "name"

    .prologue
    .line 109
    const-class v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    .locals 1

    .prologue
    .line 109
    sget-object v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    return-object v0
.end method
