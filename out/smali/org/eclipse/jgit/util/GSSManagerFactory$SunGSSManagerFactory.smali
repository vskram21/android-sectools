.class Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;
.super Lorg/eclipse/jgit/util/GSSManagerFactory;
.source "GSSManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/GSSManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SunGSSManagerFactory"
.end annotation


# static fields
.field private static GSS_MANAGER_IMPL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static HTTP_CALLER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static HTTP_CALLER_INFO_CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static IS_SUPPORTED:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 101
    :try_start_0
    invoke-static {}, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->init()V

    .line 102
    const/4 v1, 0x1

    sput-boolean v1, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->IS_SUPPORTED:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .local v0, e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 103
    .end local v0           #e:Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 104
    .restart local v0       #e:Ljava/lang/Exception;
    const/4 v1, 0x0

    sput-boolean v1, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->IS_SUPPORTED:Z

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/eclipse/jgit/util/GSSManagerFactory;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/util/GSSManagerFactory$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;-><init>()V

    return-void
.end method

.method private static init()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 110
    const-string v4, "sun.net.www.protocol.http.HttpCallerInfo"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 112
    .local v3, httpCallerInfoClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-array v4, v7, [Ljava/lang/Class;

    const-class v5, Ljava/net/URL;

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->HTTP_CALLER_INFO_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    .line 115
    const-string v4, "sun.security.jgss.HttpCaller"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 117
    .local v2, httpCallerClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-array v4, v7, [Ljava/lang/Class;

    aput-object v3, v4, v6

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->HTTP_CALLER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    .line 120
    const-string v4, "sun.security.jgss.GSSCaller"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 122
    .local v0, gssCallerClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v4, "sun.security.jgss.GSSManagerImpl"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 124
    .local v1, gssManagerImplClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-array v4, v7, [Ljava/lang/Class;

    aput-object v0, v4, v6

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->GSS_MANAGER_IMPL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    .line 127
    return-void
.end method

.method public static isSupported()Z
    .locals 1

    .prologue
    .line 135
    sget-boolean v0, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->IS_SUPPORTED:Z

    return v0
.end method


# virtual methods
.method public newInstance(Ljava/net/URL;)Lorg/ietf/jgss/GSSManager;
    .locals 6
    .parameter "url"

    .prologue
    .line 141
    :try_start_0
    sget-object v3, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->HTTP_CALLER_INFO_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 143
    .local v2, httpCallerInfo:Ljava/lang/Object;
    sget-object v3, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->HTTP_CALLER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 146
    .local v1, httpCaller:Ljava/lang/Object;
    sget-object v3, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->GSS_MANAGER_IMPL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ietf/jgss/GSSManager;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    return-object v3

    .line 148
    .end local v1           #httpCaller:Ljava/lang/Object;
    .end local v2           #httpCallerInfo:Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 149
    .local v0, e:Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 150
    .end local v0           #e:Ljava/lang/InstantiationException;
    :catch_1
    move-exception v0

    .line 151
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 152
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 153
    .local v0, e:Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 154
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v0

    .line 155
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
